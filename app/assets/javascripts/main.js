//here we want to detect when our .section enters the viewport
//when it does, we want to add a class of "in-viewport", and
//when it exits, we want to remove it again
inView('.fadein')
.on('enter', section => {
  //classList.add is the same as Jquery's .addClass() method
  section.classList.add ('visible')
})
.on('exit', section=> {
    section.classList.remove('visible')
    });

//changing background
function runOnScroll() {
    const scrollSize = parseInt(window.pageYOffset)
     if (scrollSize <= 600) {
      document.body.style.backgroundColor = "#eeddcc";
      } else if (scrollSize <= 1400) {
      document.body.style.backgroundColor = "#c49aa6";
      } else if (scrollSize <= 1800) {
      document.body.style.backgroundColor = "#8697aa";
      } else if (scrollSize <= 2800) {
      document.body.style.backgroundColor = "#eeddcc";
      } else if (scrollSize <= 3800) {
      document.body.style.backgroundColor = "#8697aa";
      } else if (scrollSize <= 4400) {
      document.body.style.backgroundColor = "#c49aa6";
      } else  {
      document.body.style.backgroundColor = "#eeddcc";
      }

 };

window.addEventListener("scroll", runOnScroll);

/* Open the sidenav */
function openNav() {
  document.getElementById("mySidenav").style.width = "100%";
}

/* Close/hide the sidenav */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}



/* Open the sidenav */
function openNav2() {
  document.getElementById("mySidenav2").style.width = "109%";
}

/* Close/hide the sidenav */
function closeNav2() {
  document.getElementById("mySidenav2").style.width = "0";
}
