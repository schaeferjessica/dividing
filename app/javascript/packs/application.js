require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require ("turbolinks").start()


import "bootstrap";
import "controllers";

import * as Overlay from '../components/overlay';
import * as Heading from '../components/heading';
import * as Navbar from '../components/navbar';
import * as Cookie from '../components/cookie';
import * as Alert from '../components/alert';
//import * as Socialmedia from '../components/socialmedia';
import * as Accordion from '../components/accordion';
import { initSocialMedia } from '../components/socialmedia';
export { Overlay, Heading, Cookie, Alert, Accordion, Navbar };


document.addEventListener('turbolinks:load', () => {
  initSocialMedia();
  $('[data-toggle="popover"]').popover()
  $('body').tooltip({selector: '[data-toggle="tooltip"]'});
});
