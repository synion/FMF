# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'form .remove_swithgears', (event) ->
	$(this).prev('input[type=hidden]').val('1')
	$(this).closest('fieldser').hide()
	event.preventDefault()

$(document).on 'click', 'form .add_fileds', (event) ->
	time = new Date().getTime()
	regexp = new RegExp($(this).data('fields').replace(regexp, time))
	event.preventDefault()