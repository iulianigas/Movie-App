//= require jquery3
//= require jquery-ui
//= require jquery.raty
//= require ratyrate
//= require popper
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require bootstrap-table/bootstrap-table
//= require chartkick
//= require Chart.bundle
//= require_tree .
import "bootstrap";
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("../javascripts/jquery.raty")
import "../javascripts/custom"
import "../stylesheets/application"  // <- Add this line
 
// document.addEventListener("turbolinks:load", () => {
//   $('[data-toggle="tooltip"]').tooltip()
//   $('[data-toggle="popover"]').popover()
// })
