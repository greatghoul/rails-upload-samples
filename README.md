实现 HTML5 拖拽上传
---------------------

HTML5 的新特性，拖拽和XmlHttpRequest2，上传越来越方便了。

### 关键的事件

`ondragover`, `ondragout`, `ondrop`

在要支持拖放文件的元素上注册上面的事件。

    $('#dnd-area').on 'dragover', dragoverHandler
    $('#dnd-area').on 'dragend', dragendHandler
    $('#dnd-area').on 'drop', dragHandler

需要注意的是，这些事件中，需要把浏览器的默认响应干掉

    XXXHandler = (evt) ->
      evt.preventDefault()
      # do something...
      false

### DataTransfer 和 FormData

`ondrop` 事件中携带了文件

    files = event.dataTransfer.files

包装成 FormData

    formData = new FormData()
    formData.append('post[picture]', files[0])

使用 XHR

    xhr = new XMLHttpRequest()
    xhr.open('POST', '/posts')
    xhr.onload = -> doSomething()
    xhr.send(formData)

或者 jQuery

    $.ajax
      url: '/posts',
      method: 'POST'
      data: formData,
      processData: false,
      contentType: false,
      success: (html) ->
        $('#post').prepend(html)
      error: (evt) ->
        alert('上传错误')

注意，如果使用 jQuery，`processData` 和 `contentType` 要设置成 `false`，避免转换错误

----

参考资料

- https://developer.mozilla.org/en-US/docs/Web/API/DataTransfer
- https://developer.mozilla.org/en-US/docs/Web/API/FormData
- http://html5doctor.com/drag-and-drop-to-server/
- http://stackoverflow.com/a/8244082/260793
