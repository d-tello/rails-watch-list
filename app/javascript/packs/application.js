// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "stylesheets/application"
import 'select2';
import "select2/dist/css/select2.css";


// Internal import

import { toggleMobileNavbar } from '../components/navbar';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { toggleModal } from '../components/modal';
import { initSelect2 } from '../plugins/initSelect2';

document.addEventListener('turbolinks:load', () => {
  toggleMobileNavbar();
  initUpdateNavbarOnScroll();
  initSelect2();
  toggleModal();
});
