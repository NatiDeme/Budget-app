class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_entities, dependent: :delete_all, foreign_key: 'groups_id'
  has_many :entities, through: :group_entities
end
