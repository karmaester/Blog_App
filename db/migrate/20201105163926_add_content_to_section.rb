class AddContentToSection < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :content, :text
  end
end
