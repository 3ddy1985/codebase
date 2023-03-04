class CodeSnippet < ApplicationRecord
  belongs_to :snippet_collection
  belongs_to :language
end
