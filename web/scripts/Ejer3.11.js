
window.addEventListener("DOMContentLoaded", verFicha)
function verFicha() {

    var sal = document.querySelectorAll('.item.redondeo');
    sal.forEach(l => l.addEventListener('dblclick', auxilar))

    function  auxilar(evt) {
        var codigo = evt.currentTarget.querySelector(".codigo")
        var a = codigo.firstChild;
        window.open(a.href, 'ventana', 'width=800,height=600')
        evt.preventDefault();
    }

}

 