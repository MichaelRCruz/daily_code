class RemoveSnippetFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :snippet, :string
  end
end
