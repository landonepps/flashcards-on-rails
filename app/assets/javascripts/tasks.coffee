# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# prevent flash message from being cached
# https://github.com/turbolinks/turbolinks/issues/303#issuecomment-312385584
# https://github.com/turbolinks/turbolinks#preparing-the-page-to-be-cached
document.addEventListener 'turbolinks:before-cache', ->
  $('.alert').remove()
