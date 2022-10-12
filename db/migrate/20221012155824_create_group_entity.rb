class CreateGroupEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :group_entities do |t|
    end
    add_reference :group_entities, :groups, index: true
    add_reference :group_entities, :entities, index: true
  end
end
