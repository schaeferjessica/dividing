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
import * as Socialmedia from '../components/socialmedia';
import * as Accordion from '../components/accordion';

export { Overlay, Heading, Cookie, Accordion, Socialmedia, Navbar };

$(function () {
  $('[data-toggle="popover"]').popover()
})
