class CreateResponsesTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :active_survey
      t.references :option
      t.references :question

      t.timestamps
    end
  end
end
