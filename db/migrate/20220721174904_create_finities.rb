class CreateFinities < ActiveRecord::Migration[6.1]
  def change
    create_table :finities do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.string :mood

      t.timestamps
    end
  end
end
