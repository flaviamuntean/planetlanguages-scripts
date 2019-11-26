class AddPhotoToMacros < ActiveRecord::Migration[5.2]
  def change
    add_column :macros, :photo, :string
  end
end
