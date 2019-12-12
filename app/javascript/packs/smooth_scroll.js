var d = document.getElementById("lobby");
var topPos = d.offsetTop;

var element = document.getElementById("button")

element.addEventListener("click", myFunction);

function myFunction() {
  window.scrollTo({
  top: topPos,
  behavior: 'smooth'
});
}
