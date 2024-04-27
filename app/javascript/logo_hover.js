console.log("Logo Hover Connected")

//LOGO hover Feature:

// document.addEventListener('DOMContentLoaded', function() {
// });

let logoBox = document.querySelector('#navLogoContainer');
let logoPaths = logoBox.getElementsByTagName('path');

logoBox.addEventListener('mouseover', changeColor);


function changeColor(){
    let r = random255();
    let g = random255();
    let b = random255();

    for(let i=0; i<logoPaths.length; i++){
        logoPaths[i].style.fill = `rgb(${r},${g},${b})`
    }
}

function random255(){
    return (Math.floor(Math.random()*255));
}
