/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//AQUI ME FALTA LA MEJORA CREO
const valores = [{value : '10-100'},{value:'100-200'},{value:'200-500'},{value:'500-1000'},{value:'1000',label:'Mas de 1000'}];

window.addEventListener("load", cambiarPrecio); 
function cambiarPrecio() {
   let selPrec = document.getElementById("precio"); 
    valores.forEach(val => {
        let opt = document.createElement("option");
        opt.text = val.label ? val.label : val.value;
        opt.value= val.value;
        selPrec.add(opt);
    })
}

