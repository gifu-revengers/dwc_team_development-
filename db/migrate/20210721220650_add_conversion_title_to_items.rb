class AddConversionTitleToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :conversion_title, :string
  end
end
