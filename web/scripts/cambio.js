/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.addEventListener("load", cambioVista);
function cambioVista() {
    var as = document.querySelector(".modovisual").getElementsByTagName("a")
    as[0].addEventListener("click", function (evt) {
        cambiadorCss.setHojaCss("mosaico")
        evt.preventDefault();
    })
    as[1].addEventListener("click", function (evt) {
        cambiadorCss.setHojaCss("lista")
        evt.preventDefault();
    })

}


