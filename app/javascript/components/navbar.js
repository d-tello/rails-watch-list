const toggleMobileNavbar = () => {
  const navbar = document.querySelector('.navbar-icon-bar');
  const menu = document.querySelector('.navbar-menu');

  if (navbar) {
    navbar.addEventListener('click', () => {
      navbar.classList.toggle('open');
      menu.classList.toggle('open');
      event.preventDefault();
    });
  }
}

export { toggleMobileNavbar };

const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');
  const navbarText = document.querySelectorAll('.navbar-menu-item')
  const navbarHamburger = document.querySelector('.navbar-icon-bar')

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 10) {
        navbar.classList.add('navbar-solid');
        navbarText.forEach(item => {
        item.classList.add('navbar-menu-item-solid')});
        navbarHamburger.classList.add('navbar-icon-bar-solid');
      } else {
        navbar.classList.remove('navbar-solid');
         navbarText.forEach(item => {
        item.classList.remove('navbar-menu-item-solid')});
        navbarHamburger.classList.remove('navbar-icon-bar-solid');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };