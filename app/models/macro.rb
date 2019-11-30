class Macro < ApplicationRecord
  validates :name, :description, :code, :tag_list, :file_type_list, presence: true
  has_many :comments, dependent: :destroy

  include PgSearch::Model

  multisearchable against: [:name, :description, :code]

  pg_search_scope :global_search,
    against: [:name, :description, :code],
    associated_against: {
      tags: [:name],
      file_types: [:name],
      clients: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  acts_as_taggable_on :tags
  acts_as_taggable_on :file_types
  acts_as_taggable_on :clients

  acts_as_favoritable

  def self.tags
    ['translation', 'approval', 'memoQ', 'single file', 'multiple files',
     'other', 'word/character count', 'TM analysis', 'checking', 'eLearning'].sort_by(&:downcase)
  end

  def self.file_types
    ['Word', 'Excel', 'PowerPoint', 'PDF'].sort_by(&:downcase)
  end

  def self.clients
    ['Optik', 'Retail Academy', 'Swarovski.com', 'Axel Springer'].sort_by(&:downcase)
  end
end
