import 'bootstrap';
import '../stylesheets/application';
import '@fortawesome/fontawesome-free/js/all';
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jKanban from 'jkanban';
import 'jkanban/dist/jkanban.min.css';
import "./partial/index.js" 
require('jquery')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
