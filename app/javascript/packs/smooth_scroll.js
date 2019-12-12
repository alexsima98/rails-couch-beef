const d = document.getElementById("lobby");
const topPos = d.offsetTop;


const scrollToIndex = () => {
  window.scrollTo({
  top: topPos,
  behavior: 'smooth'
});
}

export { scrollToIndex }


