//(JS)
//for hiding header
var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("navbar").style.top = "-85%";
    document.getElementById("footernav").style.bottom = "-120%";
  } else {
    document.getElementById("navbar").style.top = "-100%";
    document.getElementById("footernav").style.bottom = "-95%";
  }
  prevScrollpos = currentScrollPos;
}
