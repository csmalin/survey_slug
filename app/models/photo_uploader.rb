class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
    process :resize_to_fit => [170,170]
end
