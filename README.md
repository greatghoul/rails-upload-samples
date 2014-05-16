原生 Rails 实现文件上传
-----------------------

上传的最经典方式，Read-Write, 低碳环保

### 设置表单的数据类型

    <%= form_for(@post, multipart: true) do |f| %>

生成 HTML 为

    <form ... enctype="multipart/form-data">

### 使用文件选择控件 

    <%= f.file_field :picture_file, class: 'hide' %>

### 从文件读取内容并保存

    uploaded_io = params[:post][:picture_file]
    File.open(filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end

----

参考资料

- http://guides.rubyonrails.org/form_helpers.html#uploading-files
