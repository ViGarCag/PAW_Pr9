window.addEventListener("DOMContentLoaded", cant);
function cant() {
    var x = document.querySelectorAll(".cantidad");

    for (var i = 0; i < x.length; i++) {
        x[i].addEventListener('input', actualizar)
    }
}

function actualizar(evt) {
    var aux = evt.target.parentElement.parentElement.querySelector('.codigo').textContent;
    axios('api/GetStockArticulo', {
        params: {cart: aux},
        responseType: 'text'
    })
            .then(response => {
                if (response.data > evt.target.textContent) {
                    evt.target.style.color = "#C02C11";
                } else {
                    evt.target.style.color = "#5CBC67";
                }
            })
            .catch(err => {
                alert('Error [' + err + ']')
            })

}





