const alert = document.querySelector('.alert');

if (alert) {
  setTimeout(function () {
    alert.classList.remove('show');
  }, 2000);
}
