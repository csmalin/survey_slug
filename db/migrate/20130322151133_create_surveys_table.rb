class CreateSurveysTable < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :description
      t.string :title
      t.references :user

      t.timestamps
    end
  end
end
