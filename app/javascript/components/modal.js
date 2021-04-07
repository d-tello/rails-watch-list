const toggleModal = () => {

const modal = document.querySelector("#modal");
const openBtn = document.querySelector("#openBtn");
const closeBtn = document.querySelector(".closeBtn");

openBtn.addEventListener('click', () => {
modal.classList.remove('hidden');
});

closeBtn.addEventListener('click', () => {
  modal.classList.add('hidden');
});

window.addEventListener('click', (event) => {
    if (event.target == modal) {
    modal.classList.add('hidden');
  }
});
};

export { toggleModal };