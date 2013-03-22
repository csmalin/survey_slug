class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :inquisition
      t.references :survey

      t.timestamps
    end
  end
end
