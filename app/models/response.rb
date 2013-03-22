class Response < ActiveRecord::Base
  belongs_to :option
  has_many :active_surveys
end
