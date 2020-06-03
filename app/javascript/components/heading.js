import Typed from 'typed.js';
const heading = document.querySelector('#banner-typed-text');

if (heading) {
  const loadDynamicBannerText = () => {
    new Typed('#banner-typed-text', {
      strings: [
        'team lunch.',
        'cinema visit.',
        'holiday booking.',
        'food shop.',
      ],
      typeSpeed: 150,
      loop: true,
    });
  };
  loadDynamicBannerText();
}
