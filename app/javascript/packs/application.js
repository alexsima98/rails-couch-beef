import "bootstrap";


import { scrollToIndex } from "./smooth_scroll.js"

const element = document.getElementById("button")
element.addEventListener("click", scrollToIndex);
