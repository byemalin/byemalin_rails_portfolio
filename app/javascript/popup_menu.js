console.log("Popup Javascript Connected");

//Popup Menu JS

// greeting on home page hero

//popup and closeIcon
let popup = document.querySelector('.popupMenuContainer');
let closeIcon = document.querySelector('.closeIcon');

if (document.getElementById('greetingContainer')){
  let greeting = document.getElementById('greetingContainer');

  greeting.onclick = displayHeroPopup;
  closeIcon.onclick = hideHeroPopup;

  function displayHeroPopup(){
      popup.style.width='50vw';
  }

  function hideHeroPopup(){
      popup.style.width='0px';
  }
}




// Responsive popup:
let burger = document.querySelector('.burgerContainer');
let body = document.querySelector('body');


burger.onclick = displayPopup;
closeIcon.onclick = hidePopup;


function displayPopup(){
    popup.style.width='100vw';

    body.style.height='100px';
    body.style.overflow = 'hidden';
}

function hidePopup(){
    popup.style.width='0px';

    body.style.height='100%';
    body.style.overflow = 'visible';
}









// Animation colours for close icon:

let closeLines = closeIcon.getElementsByTagName('line');


closeIcon.addEventListener('mouseover', iconHover);
closeIcon.addEventListener('mouseout', iconOut);


function iconHover(){
    closeIcon.style.backgroundColor='#3C3D3E';

    for(let i=0; i<2; i++){
        closeLines[i].style.stroke = '#F4F7FA';
    }
}

function iconOut(){
    closeIcon.style.backgroundColor='#F4F7FA';

    for(let i=0; i<2; i++){
        closeLines[i].style.stroke = '#3C3D3E';
    }
}
