class CreateCodeSnippets < ActiveRecord::Migration[7.0]
  def change
    create_table :code_snippets do |t|
      t.references :snippet_collection, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
