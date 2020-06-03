const overlayBtns = document.querySelectorAll('.btn-overlay');
const overlayWrapper = document.querySelector('.overlay-wrapper');
const overlays = document.querySelectorAll('.overlay');
const overlayCloseBtn = document.querySelector('.btn-close');

if (overlayBtns.length) {
  overlayBtns.forEach(button => {
    button.addEventListener('click', () => {
      const target = document.querySelector(`#${button.dataset.target}`);

      // activate overlay wrapper
      overlayWrapper.classList.add('is-active');

      // hide all overlays (reset)
      overlays.forEach(overlay => overlay.classList.add('is-hidden'));

      // show the target overlay
      target.classList.remove('is-hidden');
    });
  });
}

if (overlayCloseBtn) {
  overlayCloseBtn.addEventListener('click', (event) => {
    // hide overlay wrapper
    overlayWrapper.classList.remove('is-active');

    // hide all overlays (reset)
      overlays.forEach(overlay => overlay.classList.add('is-hidden'));
  });
}
