window.addEventListener("load", OcultarCampos_Nom_Cod);
function OcultarCampos_Nom_Cod() {
    if (codigo && nombre) {
        campo_nombre = document.getElementById("nombre");
        campo_codigo = document.getElementById("codigo");
        lupa = document.getElementById("buscar");
        campo_nombre.hidden = true;
        campo_codigo.hidden = true;
        campo_nombre.disabled = true;
        campo_codigo.disabled = true;
        var destino = document.createElement("span")
        destino.innerHTML = '&nbsp; <button style="backgroundcolor:white; border:none"><span class="fas fa-ellipsis-v"></span></button></span>';
        lupa.before(destino);
        destino.addEventListener("click", click3puntos);
        function click3puntos(evt) {
            campo_nombre.hidden = false;
            campo_codigo.hidden = false;
            campo_nombre.disabled = false;
            campo_codigo.disabled = false;
            destino.hidden = true;
            evt.preventDefault();
        }
    }

}


