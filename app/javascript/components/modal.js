const toggleModal = () => {
  const modal = document.querySelector("#modal");
  const openBtn = document.querySelector("#openBtn");
  const closeBtn = document.querySelector(".closeBtn");
  const menu = document.querySelector(".navbar-menu");
  const navbar = document.querySelector(".navbar-icon-bar");

  openBtn.addEventListener("click", () => {
    modal.classList.remove("hidden");
    menu.classList.remove("open");
    navbar.classList.remove("open");
  });

  closeBtn.addEventListener("click", () => {
    modal.classList.add("hidden");
  });

  window.addEventListener("click", (event) => {
    if (event.target == modal) {
      modal.classList.add("hidden");
    }
  });
};

export { toggleModal };
