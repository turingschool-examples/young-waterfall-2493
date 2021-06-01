class CreateBlockbusters < ActiveRecord::Migration[5.2]
  def change
    create_table :blockbusters do |t|
      t.references :actor, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
