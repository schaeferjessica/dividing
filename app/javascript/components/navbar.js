const navWrapper = document.querySelector('.nav-wrapper');
const burger = document.querySelector('.burger');

if (navWrapper) {
  burger.addEventListener('click', (event) => {
    navWrapper.classList.toggle('is-active');
  });
}
