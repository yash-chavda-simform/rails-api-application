class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.date :date_of_comment
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
