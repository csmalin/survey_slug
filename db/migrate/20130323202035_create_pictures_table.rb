class CreatePicturesTable < ActiveRecord::Migration
  def change
    create_table :pictures do |c|
      c.references :survey
      c.string :picture
    end
  end
end
