window.addEventListener("load",fecha);
function fecha(){
    //var y = document.getElementsByClassName("fecha");
   // var y=document.getElementsByTagName("input");
    var y = document.forms[0].elements;
    for(var i=0;i<y.length;i++){
        if(y[i].className=="fecha"){
            setCalendar(y[i]);
        }
    }
    function setCalendar(campo) {
        // Configuración del calendario
        let calCnf = {
            dateFormat: "%d/%m/%Y",
            css: "dhx_widget--bordered",
            value: campo.value,
            disabledDates: date => date < new Date()
        }
        let calendar = new dhx.Calendar(null, calCnf); // Creación del calendario
        let popup = new dhx.Popup(); // Pop-up ...
        popup.attach(calendar); // ... asociado al calendario ...
        campo.addEventListener("click", function () {
            popup.show(campo); // ...que se muestra al hacer clic en el campo
        });
        calendar.events.on("change", function () { // Al seleccionar una fecha...
            campo.value = calendar.getValue(); // ... se cambia el valor del campo y ...
                popup.hide(); // ... se oculta el pop-up/calendario
         });
    }
}


