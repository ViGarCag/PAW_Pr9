window.addEventListener("DOMContentLoaded",Vista)
function Vista(){
    var checkbox=document.getElementById("otroTip");
    checkbox.addEventListener("change",cambio)
    function cambio(){
        
        if(checkbox.checked){
            var aux = document.getElementById("otrotipoCont");
            var aux2 = document.getElementById("tipo");
            aux.innerHTML= '<label>&nbsp;</label><input class="text" type="text" name="tipo" id="tipo" value="" >'
            aux2.disabled=true;
            
        }else{
            var aux = document.getElementById("otrotipoCont");
            var aux2 = document.getElementById("tipo");
            aux.innerHTML= ''
            aux2.disabled=false;
        }
    }
}

window.addEventListener("DOMContentLoaded",Vista2)
function Vista2(){
    var checkbox=document.getElementById("otroFab");
    checkbox.addEventListener("change",cambio2)
    function cambio2(){
        if(checkbox.checked){
            var aux = document.getElementById("otrofabricanteCont");
            var aux2 = document.getElementById("fabricante");
            aux.innerHTML= '<label>&nbsp;</label><input class="text" type="text" name="tipo" id="tipo" value="" >'
            aux2.disabled=true;
        }else{
            var aux = document.getElementById("otrofabricanteCont");
            var aux2 = document.getElementById("fabricante");
            aux.innerHTML= ''
            aux2.disabled=false;
        }
        
    }
}
