/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.addEventListener("load", FiltroBusqueda);
function FiltroBusqueda() {
    var x = document.forms[0].elements;
    for (var i = 0; i < x.length; i++) {
        if (x[i].name === "tipo") {
            x[i].onchange = function () {
                document.getElementById("filtroCatalogo").submit();
            }
        }
        if (x[i].name === "fabricante") {
            x[i].onchange = function () {
                document.getElementById("filtroCatalogo").submit();
            }
        }
        if (x[i].name === "precio") {
            x[i].onchange = function () {
                document.getElementById("filtroCatalogo").submit();
            }
        }

    }
}



