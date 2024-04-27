console.log("Project Hover Script Connected")

// This function is for the styling of the Recent Project Card on Hover

// Take all the relevant cards from any page
let cards = document.getElementsByClassName("recentProject")


// Iterate through them and add event listener
for (let card of cards) {
  card.addEventListener('mouseover', SetHoverStyle);
  card.addEventListener('mouseout', ResetHoverStyle);

  let openIcon = card.querySelector('.openIcon');
  let openArrow = card.querySelector('path');

  // Define the functions to change the styles
  function SetHoverStyle(e) {
    openIcon.style.backgroundColor = '#3C3D3E';
    openArrow.style.fill= '#F4F7FA';
  }


  function ResetHoverStyle(e) {
    openIcon.style.backgroundColor = '#F4F7FA';
    openArrow.style.fill= '#3C3D3E';
  }
};
