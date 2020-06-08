const btnLink = document.querySelector('.btn-link');
const socialList = document.querySelector('.socialmedia-list')

btnLink && btnLink.addEventListener('click', (event) => {
    socialList.classList.toggle('is-active');
  });

const copyTextareaBtn = document.querySelector('.link');

copyTextareaBtn && copyTextareaBtn.addEventListener('click', function(event) {
  var dummy = document.createElement('input');
  const url = window.location.href;
  document.body.appendChild(dummy);
  dummy.value = url;
  dummy.select();

  try {
    const successful = document.execCommand('copy');
    const msg = successful ? 'successful' : 'unsuccessful';
    console.log('Copying text command was ' + msg);
  } catch (err) {
    console.log('Oops, unable to copy');
  }
});

