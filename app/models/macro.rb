class Macro < ApplicationRecord
  validates :name, :description, :code, presence: true
  has_many :comments, dependent: :destroy

  include PgSearch::Model

  multisearchable against: [:name, :description, :code]

  pg_search_scope :global_search,
    against: [:name, :description, :code],
    using: {
      tsearch: { prefix: true }
    }
  acts_as_taggable_on :tags

  acts_as_favoritable

  def self.tags
    ['translation', 'approval', 'memoQ', 'single file', 'multiple files', 'Optik',
     'other', 'Retail Academy', 'Word', 'Excel', 'PowerPoint', 'Deichmann',
     'word counts', 'Swarovski.com', 'TM analysis', 'checking', 'eLearning'].sort_by(&:downcase)
  end
end
