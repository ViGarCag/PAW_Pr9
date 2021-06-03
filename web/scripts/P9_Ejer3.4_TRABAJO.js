
window.addEventListener('DOMContentLoaded', f)
function f() {
    var cp2 = document.getElementById('cp')
    cp2.addEventListener('input', buscar)
    function buscar(evt) {
        var aux = evt.target.value;
        axios('GetProvinciaDeCp', {
                    params: {cp: aux},
                    responseType: 'text'
                }).then(response => {
            aux2 = document.getElementById('provincia').value = response.data
        }).catch();
    }


}


