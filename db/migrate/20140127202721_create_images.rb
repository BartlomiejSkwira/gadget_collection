class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file, null: :false
      t.references :gadget, null: :false
    end
  end
end
