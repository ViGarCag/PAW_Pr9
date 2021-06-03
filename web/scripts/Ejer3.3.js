window.addEventListener("load", Contr);
function Contr() {
    var imagen_ojos = document.getElementsByClassName("verContr");
    //var span = document.querySelectorAll("a.verContr span");

    imagen_ojos [0].addEventListener("click", ClickOjos);
    imagen_ojos [1].addEventListener("click", ClickOjos);
    
    function ClickOjos(evt) {
        hijo=this.firstElementChild;
        padre=this.parentElement;
        if (padre.getElementsByTagName("input")[0].type === "password") {
            padre.getElementsByTagName("input")[0].type = "text";
            hijo.className = "fas fa-eye-slash";
        } else {
            padre.getElementsByTagName("input")[0].type = "password";
            hijo.className = "fas fa-eye";
        }
        evt.preventDefault();
    }
}


