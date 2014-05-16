利用隐藏 iframe 实现无刷新上传
------------------------------

为了伺候万恶的旧浏览器，不得不为了兼容性的考虑，把 HTML5 放在一边。

### Form 的 Target 属性

Form 可以指定提交到的目标窗体，比如 `_blank` 会提交到新窗口，而不是刷新当前页面。
你也可以指定 target 来提交请求到指定的 frame

### 隐藏的 iframe 

    <iframe src="about:blank" id="upload_frame" name="upload_frame" style="display: none;"></iframe>

注意，这里 id 和 name 设置成同样的值，是为了兼顾浏览器差异。

### 提交到 iframe

既然 iframe 看不见，请求提交到这里，用户也不会发觉，仿佛是 Ajax 一样。

    <%= form_for(@post, html: { multipart: true, target: "upload_frame" }) do |f| %>

### 爸爸去哪儿

既然不是 Ajax，那请求还是个页面，我们需要一个页面。

  def create
    # ...
    respond_to do |format|
      format.html
    end
  end

使用 `parent` 操作父页面

app/views/posts/create.html

    <script type="text/javascript">
      parent.$('#posts').prepend('<%= j(render partial: 'post', object: @post) %>');
      parent.$('form').reset();
    </script>

----

参考资料

- http://www.w3schools.com/tags/att_form_target.asp
- http://stackoverflow.com/a/7085607/260793

