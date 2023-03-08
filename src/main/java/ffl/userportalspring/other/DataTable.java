/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.other;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Akash
 */
public class DataTable {

    public static JSONObject getData(Connection con, JSONObject para, PreparedStatement ps) throws Exception {
        String qry = ps.toString().split("\\:", 0)[1].trim();

        Pattern allcols = Pattern.compile("(?<=select)(.*)(?=from)+(?![^(]*\\))", Pattern.CASE_INSENSITIVE);
        Matcher allcolsMatcher = allcols.matcher(qry);

        String cols = "";
        if (allcolsMatcher.find()) {
            cols = allcolsMatcher.group(0);
        } else {
            throw new Exception("No Columns to Select");
        }
        String tableAndConditions = qry.split(Pattern.quote(cols))[1];

        JSONObject resp = new JSONObject();
        JSONArray rows = new JSONArray();
        resp.put("draw", para.get("draw"));
        ResultSet cnt = db.search(con, "SELECT COUNT(1) FROM (SELECT 1 " + tableAndConditions + " )tbl");
        cnt.next();
        int cc = cnt.getInt(1);
        resp.put("recordsTotal", cc);
        String search = "";
        JSONObject searchval = para.getJSONObject("search");
        if (searchval != null && searchval.getString("value").length() > 0) {
            search = " AND CONCAT_WS(''," + cols + ") LIKE '%" + searchval.getString("value") + "%'";
        }
        int to = para.getInt("length");
        if (to == -1) {
            to = cc;
        }
        JSONArray columns = para.getJSONArray("columns");
        JSONArray orders = para.getJSONArray("order");
        String order_q = "";
        for (int i = 0; i < orders.length(); i++) {
            JSONObject order = orders.getJSONObject(i);
            order_q += "," + (order.getInt("column") + 1) + " " + order.getString("dir");
        }
        if (order_q.length() > 0) {
            order_q = " ORDER BY " + order_q.substring(1);
        }
        // System.out.println("SELECT " + cols + tableAndConditions + search + order_q + " LIMIT " + para.getInt("start") + "," + to);
        ResultSet rs = db.search(con, "SELECT " + cols + tableAndConditions + search + order_q + " LIMIT " + para.getInt("start") + "," + to);
        while (rs.next()) {
            JSONObject row = new JSONObject();
            for (int j = 0; j < columns.length(); j++) {
                JSONObject column = columns.getJSONObject(j);
                row.put(column.get("data").toString(), rs.getString(j + 1));
            }
            rows.put(row);
        }

        if (searchval != null && searchval.getString("value").length() > 0) {
            ResultSet filcr = db.search(con, "SELECT count(1) FROM (SELECT 1 " + tableAndConditions + search + ")tb");
            filcr.next();
            resp.put("recordsFiltered", filcr.getInt(1));
        } else {
            resp.put("recordsFiltered", cc);
        }
        resp.put("data", rows);

        return resp;
    }

}
