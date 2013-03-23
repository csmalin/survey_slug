class AddTitleToActiveSurveys < ActiveRecord::Migration
  def change
    add_column :active_surveys, :title, :string
  end
end
