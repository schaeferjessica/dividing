const closeLogin = document.querySelector('.close-login');
const closeSignup = document.querySelector('.close-signup');
const closeEdit = document.querySelector('.close-edit');
const openLogin = document.querySelector('.btn-sign-in');
const openSignup = document.querySelector('.btn-sign-up');
const openEdit = document.querySelector('.btn-edit');
const overlayLogin = document.querySelector('#log-in-container');
const overlaySignup = document.querySelector('#sign-up-container');
const overlayEdit = document.querySelector('#edit-container');

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

if (openEdit) {
  openEdit.addEventListener('click', (event) => {
    overlayEdit.classList.remove('is-hidden');
  });
}

if (closeEdit) {
  closeEdit.addEventListener('click', (event) => {
    overlayEdit.classList.add('is-hidden');
  });
}
