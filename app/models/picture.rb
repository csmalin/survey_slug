class Picture < ActiveRecord::Base
  extend CarrierWave::Mount
  belongs_to :survey
  mount_uploader :photo, PhotoUploader
end
