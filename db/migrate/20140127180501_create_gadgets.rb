class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name, null: false
      t.references :user, index: true, null: false
    end
  end
end
