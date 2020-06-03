const overlayBtns = document.querySelectorAll('.btn-overlay');
const overlayWrapper = document.querySelector('.overlay-wrapper');
const overlays = document.querySelectorAll('.overlay');
const overlayCloseBtn = document.querySelector('.btn-close');
const matches = (el, selector) =>
  (
    el.matches ||
    el.matchesSelector ||
    el.msMatchesSelector ||
    el.webkitMatchesSelector
  ).call(el, selector);

// helper for letting us know if the target is in some specific element
const closest = (element, selector, checkSelf = true) => {
  let parent = checkSelf ? element : element.parentNode;
  while (parent && parent !== document) {
    if (matches(parent, selector)) return parent;
    parent = parent.parentNode;
  }
  return false;
};

// if user clicked outsite of overlay (and the overlay is open) = close it
const onBodyClick = event => {
  const { target } = event;
  const insideOverlay = closest(target, '.overlay-wrapper');
  const insideNavbar = closest(target, '.navbar');
  const isOpen = overlayWrapper.classList.contains('is-active');
  if (insideOverlay || insideNavbar) return;


  if (isOpen) {
    overlayWrapper.classList.remove('is-active');
    // hide all overlays (reset)
    overlays.forEach(overlay => overlay.classList.add('is-hidden'));
  }
};

if (overlayWrapper) {
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

  overlayCloseBtn.addEventListener('click', (event) => {
    // hide overlay wrapper
    overlayWrapper.classList.remove('is-active');
    // hide all overlays (reset)
    overlays.forEach(overlay => overlay.classList.add('is-hidden'));
  });

  window.addEventListener('click', onBodyClick);
}
