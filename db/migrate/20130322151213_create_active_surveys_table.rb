 class CreateActiveSurveysTable < ActiveRecord::Migration
  def change
    create_table :active_surveys do |t|
      t.references :response
      t.references :survey
      t.references :user

      t.timestamps
    end
  end
end
