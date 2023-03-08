/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function printDiv() {

    var divToPrint = document.createElement('html');
    divToPrint.innerHTML = "<body onload='window.print()'></body>";

    html2canvas(document.querySelector("#print_bod")).then(canvas => {
        divToPrint.getElementsByTagName('body')[0].appendChild(canvas);
        console.log(canvas);
    });

    var newWin = window.open('', 'Print-Window');

    newWin.document.open();

    newWin.document.appendChild(divToPrint);

    //newWin.document.print();

    newWin.document.close();



}

function printDiv2() {

    var divToPrint = document.createElement('html');
    divToPrint.innerHTML = "<body onload='window.print()'></body>";

    html2canvas(document.querySelector("#print_bod2")).then(canvas => {
        divToPrint.getElementsByTagName('body')[0].appendChild(canvas);
        console.log(canvas);
    });

    var newWin = window.open('', 'Print-Window');

    newWin.document.open();

    newWin.document.appendChild(divToPrint);

    //newWin.document.print();

    newWin.document.close();



}

function printDiv3() {

    var divToPrint = document.createElement('html');
    divToPrint.innerHTML = "<body onload='window.print()'></body>";

    html2canvas(document.querySelector("#print_bod3")).then(canvas => {
        divToPrint.getElementsByTagName('body')[0].appendChild(canvas);
        console.log(canvas);
    });

    var newWin = window.open('', 'Print-Window');

    newWin.document.open();

    newWin.document.appendChild(divToPrint);

    //newWin.document.print();

    newWin.document.close();



}

function printDiv4() {

    var divToPrint = document.createElement('html');
    divToPrint.innerHTML = "<body onload='window.print()'></body>";

    html2canvas(document.querySelector("#print_bod4")).then(canvas => {
        divToPrint.getElementsByTagName('body')[0].appendChild(canvas);
        console.log(canvas);
    });

    var newWin = window.open('', 'Print-Window');

    newWin.document.open();

    newWin.document.appendChild(divToPrint);

    //newWin.document.print();

    newWin.document.close();



}

