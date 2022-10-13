class GroupEntity < ApplicationRecord
  belongs_to :entities, class_name: 'Entity'
  belongs_to :groups, class_name: 'Group'
end
