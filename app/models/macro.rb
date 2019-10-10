class Macro < ApplicationRecord
  validates :name, :description, :code, presence: true

  include PgSearch::Model

  multisearchable against: [:name, :description, :code]

  pg_search_scope :global_search,
    against: [:name, :description, :code],
    using: {
      tsearch: { prefix: true }
    }
end
