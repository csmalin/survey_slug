class Response < ActiveRecord::Base
  belongs_to :option
  belongs_to :active_survey
end
