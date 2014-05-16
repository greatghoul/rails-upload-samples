使用 CarrierWave 实现多文件上传
-------------------------------

多文件上传的实现方式很多，这里以 HTML5 多选文件控件为例。

### HTML5 的新秀，支持多选的文件控件

    <%= f.file_field :picture, multiple: true %>

当选择多个文件上传后，文件列表会以数组的形式作为参数传入。

### 支持多个附件

支持多个附件

    Post (1) <-----> (n) Picture(post_id, picture)

使用嵌套

    class Post < ActiveRecord::Base
      has_many :pictures
      accepts_nested_attributes_for :pictures
    end

    class Picture < ActiveRecord::Base
      belongs_to :post

      mount_uploader :picture, PictureUploader
    end

### 我很懒，交给 CarrierWave 吧

为了让 CarrierWave 处理，我们需要构造特殊的 `name`

    <%= f.file_field :picture, multiple: true, name: 'post[pictures_attributes][][picture]' %>

### Strong Parameter

    def post_params
      params.require(:post).permit(:content, pictures_attributes: [:picture])
    end

----

参考资料

- http://www.w3school.com.cn/html5/att_input_multiple.asp
- http://stackoverflow.com/questions/21411988/rails-4-multiple-image-or-file-upload-using-carrierwave
- http://www.emersonlackey.com/article/rails-paperclip-multiple-file-uploads
- http://amgrade.com/blogs/thoughts/multiple-files-upload-rails
- https://github.com/blueimp/jQuery-File-Upload/
- http://www.cnblogs.com/2050/archive/2012/08/29/2662932.html
- http://huacnlee.com/blog/rails-multi-files-upload-with-swfupload/
- https://github.com/lardawge/swfupload-rails-authentication
