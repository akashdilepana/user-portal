<%-- 
    Document   : style
    Created on : Feb 1, 2023, 10:37:42 AM
    Author     : Akash
--%>

<style> 
    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: red;
        color: #204c95;
    }


    .alert {

        --bs-alert-padding-y: 0.1rem;
        --bs-alert-margin-bottom: 0rem;
        --bs-alert-margin-bottom: 0rem;
    }
    .alert-success {
        --bs-alert-color: white;
        --bs-alert-bg: #0ac282;
    }
    .alert-danger {
        --bs-alert-color: white;
        --bs-alert-bg: #fe5d70;
    }
    .placeholder {
        cursor: pointer; 
        background-color: transparent; 
        opacity: 1; 
    }
    table.dataTable {

        border-collapse:collapse !important;
        border-spacing: 0;
    }
    div.dataTables_wrapper div.dataTables_length select {
        width: 40%; 
        display: inline-block;
        margin-left: 5px;
    }
    .pagination {
        --bs-pagination-font-size: 0.8rem;
    }


    .div-load{position:relative;overflow:hidden}.div-load .div-loader{position:absolute;top:0;left:0;width:100%;height:100%;display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;background-color:rgba(255,255,255,.7);z-index:999}.div-load .div-loader i{margin:0 auto;color:#4099ff;font-size:20px}.loader2{margin:auto;width:50%;border:4px solid #f3f3f3;border-top:4px solid #3498db;border-radius:50%;width:40px;height:40px;animation:spin .8s linear infinite}@keyframes spin{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}

    .navbar2 {
        overflow: hidden;
        background-color: #c7e8ff;
        margin-top: 60px;
        margin-bottom: 20px;
    }


    .navbar2 a {
        float: left;
        font-size: 12px;
        color: #353c4e;
        text-align: center;
        padding: 8px 28px;
        text-decoration: none;
        font-weight: 600;
    }

    .dropdown2 {
        float: left;
        overflow: hidden;
    }

    .dropdown2 .dropbtn2 {
        font-size: 12px;  
        border: none;
        outline: none;
        color: #353c4e;
        padding: 8px 28px;
        background-color: inherit;
        font-family: inherit;
        margin: 0;
        font-weight: 600;
    }

    .navbar2 a:hover, .dropdown2:hover .dropbtn2 {
        background-color: white;
    }

    .dropdown-content2 {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content2 a {
        float: none;
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropdown-content2 a:hover {
        background-color: #ddd;
    }

    .dropdown2:hover .dropdown-content2 {
        display: block;
    }
    .ss-main .ss-single-selected {
        height: 38px;
    }
</style>