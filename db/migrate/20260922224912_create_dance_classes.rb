class CreateDanceClasses < ActiveRecord::Migration[7.2]
  def change
    create_table :dance_classes do |t|
      t.string :name, null: false
      t.text :description
      t.references :dance_style,
                   null: false,
                   foreign_key: true

      t.timestamps
    end
  end
end
