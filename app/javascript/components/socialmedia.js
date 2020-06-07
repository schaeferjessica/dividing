const btnLink = document.querySelector('.btn-link');
const socialList = document.querySelector('.socialmedia-list')

btnLink && btnLink.addEventListener('click', (event) => {
    socialList.classList.toggle('is-active');
  });
