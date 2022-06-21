class AddTitleToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :title, :string
    add_column :events, :content, :text
  end
end
