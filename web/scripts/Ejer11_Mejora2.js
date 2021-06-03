window.addEventListener("DOMContentLoaded", verFicha)
function verFicha() {

    var sal = document.querySelectorAll('.aux');
    sal.forEach(l => l.addEventListener('dblclick', auxilar))
    

    function  auxilar(evt) {
        var codigo = evt.currentTarget.getElementsByTagName("td")[2].firstChild;
        window.open(codigo.href, 'ventana', 'width=800,height=600')
        evt.preventDefault();
    }

}
