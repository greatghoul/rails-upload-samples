# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#dnd-area').on 'dragover', (evt) ->
    evt.preventDefault()
    @className = 'dragover'
    false

  $('#dnd-area').on 'dragend', (evt) ->
    evt.preventDefault()
    @className = ''
    false

  $('#dnd-area').on 'drop', (evt) ->
    evt.preventDefault()
    alert(1)
    @className = ''
    files = event.dataTransfer.files
    console.log(files)
    false

