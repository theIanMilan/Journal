// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require_tree .
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Toastr
global.toastr = require("toastr")

// Bootstrap
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

// Flatpickr datepicker
const flatpickr = require("flatpickr")
import 'flatpickr/dist/themes/material_red.css'

// Trix Richtext Editor
require("trix")
require("@rails/actiontext")

// App Stylesheets
import "../stylesheets/application"