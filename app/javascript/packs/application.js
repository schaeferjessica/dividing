require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require ("turbolinks").start()

import "bootstrap";

import * as Overlay from '../components/overlay';
import * as Heading from '../components/heading';

export { Overlay, Heading };

import "controllers"
