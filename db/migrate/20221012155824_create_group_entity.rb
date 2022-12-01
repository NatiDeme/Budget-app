class CreateGroupEntity < ActiveRecord::Migration[7.0]
  def change
    # rubocop:disable Lint/EmptyBlock
    create_table :group_entities do |t|
    end
    # rubocop:enable Lint/EmptyBlock
    add_reference :group_entities, :groups, index: true
    add_reference :group_entities, :entities, index: true
  end
end
