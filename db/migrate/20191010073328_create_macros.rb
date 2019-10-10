class CreateMacros < ActiveRecord::Migration[5.2]
  def change
    create_table :macros do |t|
      t.string :name
      t.text :description
      t.text :code

      t.timestamps
    end
  end
end
