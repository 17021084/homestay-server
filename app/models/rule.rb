class Rule < ApplicationRecord
  has_and_belongs_to_many :places

  scope :search_by_id, ->(ids){where id: ids}
end
