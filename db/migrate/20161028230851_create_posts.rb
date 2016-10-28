class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :snippet
      t.string :content
      t.string :language
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
