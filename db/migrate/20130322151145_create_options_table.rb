class CreateOptionsTable < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :choice
      t.references :question

      t.timestamps
    end
  end
end
