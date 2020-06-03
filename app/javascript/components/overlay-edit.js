const btnClose = document.querySelector('.close-edit');
const btnOpenUp = document.querySelector('.btn-edit');
const overlay = document.querySelector('#edit-container');

if (btnOpenUp) {
  btnOpenUp.addEventListener('click', (event) => {
    overlay.classList.remove('is-hidden');
  });
}

if (btnClose) {
  btnClose.addEventListener('click', (event) => {
    overlay.classList.add('is-hidden');
  });
}
