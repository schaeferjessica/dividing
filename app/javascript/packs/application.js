require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require ("turbolinks").start()

import "bootstrap";

import * as Overlay from '../components/overlay';
import * as Heading from '../components/heading';
import * as Cookie from '../components/cookie';

export { Overlay, Heading, Cookie };

import "controllers"
