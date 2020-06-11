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
//import * as Socialmedia from '../components/socialmedia';
import * as Accordion from '../components/accordion';
import { initSocialMedia } from '../components/socialmedia';
export { Overlay, Heading, Cookie, Accordion, Navbar };

$(function () {
  $('[data-toggle="popover"]').popover()
})

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initSocialMedia();
});