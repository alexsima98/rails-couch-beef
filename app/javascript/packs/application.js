import "bootstrap";


import { scrollToIndex } from "./smooth_scroll.js"

const element = document.getElementById("button")
if (element) {
  element.addEventListener("click", scrollToIndex);
}
