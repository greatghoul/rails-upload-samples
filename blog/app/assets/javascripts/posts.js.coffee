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
    @className = ''
    files = event.dataTransfer.files
    formData = new FormData()
    formData.append('post[picture]', files[0])

    $.ajax
      url: '/posts',
      method: 'POST'
      data: formData,
      processData: false,
      contentType: false,
      success: (html) ->
        $('#posts').prepend(html)
      error: (evt) ->
        alert('上传错误')

    false

