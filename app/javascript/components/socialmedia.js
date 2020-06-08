const btnLink = document.querySelector('.btn-link');
const socialList = document.querySelector('.socialmedia-list')

btnLink && btnLink.addEventListener('click', (event) => {
    socialList.classList.toggle('is-active');
    console.log("yo");
  });

var copyTextareaBtn = document.querySelector('.link');

copyTextareaBtn.addEventListener('click', function(event) {
  var dummy = document.createElement('input');
  const url = window.location.href;
  document.body.appendChild(dummy);
  dummy.value = url;
  dummy.select();

  try {
    var successful = document.execCommand('copy');
    var msg = successful ? 'successful' : 'unsuccessful';
    console.log('Copying text command was ' + msg);
  } catch (err) {
    console.log('Oops, unable to copy');
  }
});

