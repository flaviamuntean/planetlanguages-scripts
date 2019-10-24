class AddMacroRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :macro, foreign_key: true
  end
end
