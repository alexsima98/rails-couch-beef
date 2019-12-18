


const scrollToIndex = () => {
  const d = document.getElementById("lobby");

  if (d) {
    const topPos = d.offsetTop;

    window.scrollTo({
      top: topPos,
      behavior: 'smooth'
    })
  };
}

export { scrollToIndex }


