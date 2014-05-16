使用 CarrierWave 实现文件上传
-----------------------------

CarrierWave 这才是 Rails 的风格！

### 安装依赖

    gem 'carrierwave'

### Uploader 的魔法

生成一个 Uploader

    rails generate uploader Picture

一些简要的配置

    class PictureUploader < CarrierWave::Uploader::Base
      storage :file

      # ...

      def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end

Mount uploader

    class Post < ActiveRecord::Base
      mount_uploader :picture, PictureUploader
    end

### 上传文件

除了指定 `multipart: true` 你不用额外再做任何事了!

### 文件 URL

    <%= image_tag '附件地址' post.picture.url if post.picture? %>

----

参考资料

- https://github.com/carrierwaveuploader/carrierwave
- https://github.com/thoughtbot/paperclip
