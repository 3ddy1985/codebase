class CreateSnippetCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :snippet_collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
