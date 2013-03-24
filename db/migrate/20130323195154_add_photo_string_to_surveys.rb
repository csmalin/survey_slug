class AddPhotoStringToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :photo_string, :string
  end
end
