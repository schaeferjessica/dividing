const closeLogin = document.querySelector('.close-login');
const closeSignup = document.querySelector('.close-signup');
const openLogin = document.querySelector('.btn-sign-in');
const openSignup = document.querySelector('.btn-sign-up');
const overlayLogin = document.querySelector('#log-in-container');
const overlaySignup = document.querySelector('#sign-up-container');

if (openLogin) {
  openLogin.addEventListener('click', (event) => {
    overlayLogin.classList.remove('is-hidden');
  });
}

if (closeLogin) {
  closeLogin.addEventListener('click', (event) => {
    overlayLogin.classList.add('is-hidden');
  });
}

if (openSignup) {
  openSignup.addEventListener('click', (event) => {
    overlaySignup.classList.remove('is-hidden');
  });
}

if (closeSignup) {
  closeSignup.addEventListener('click', (event) => {
    overlaySignup.classList.add('is-hidden');
  });
}
