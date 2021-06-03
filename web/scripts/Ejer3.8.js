window.addEventListener("load", DragDrop);
function DragDrop() {
    var li = Array.from(document.querySelectorAll(".item[draggable]"));
    li.forEach(i => i.addEventListener("dragstart", function (evento) {
        var enlace = this.querySelector('.carro a').href; 
        event.dataTransfer.setData('enlace', enlace);
        })
    );
    
    var aux=document.getElementById("carroDrop");
    aux.addEventListener("dragover",function (evento) {
        evento.preventDefault();
    });
    aux.addEventListener("drop",function (evento) {
        //var enlace = evento.dataTransfer.getData('enlace');
        //var url='${returnURL}';
        //window.location = enlace+"&ret="+encodeURIComponent("/"+url);
        var enlace = evento.dataTransfer.getData('enlace') ;
        window.location = enlace;
    });
    //ESTO SIRVE PARA QUE LAS FOTOS NO SE PUEDAN ARRASTRAR
    var fotos = Array.from(document.querySelectorAll(".foto"));
    fotos.forEach(f => f.addEventListener("dragstart", function (evt) {
            evt.preventDefault();
            evt.stopPropagation();
        })
    );
}