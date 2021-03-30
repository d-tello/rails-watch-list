const toggleMobileNavbar = () => {
  const navbar = document.querySelector('.header__icon-bar');
  const menu = document.querySelector('.header__menu');

  if (navbar) {
    navbar.addEventListener('click', () => {
      navbar.classList.toggle('open');
      menu.classList.toggle('open');
      event.preventDefault();
    });
  }
}

export { toggleMobileNavbar };
