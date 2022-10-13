class TransactionsController < ApplicationController
  def index
  end
  def new
    @groups = Group.all
  end
  def create
    @group_id = params.require(:transaction).permit(:groups_id)
    @group = Group.find_by(id: @group_id['groups_id'])
    @group_entity = GroupEntity.new
    @transaction = Entity.new(transaction_params)
    @transaction.user = current_user
    if @transaction.valid?
      @transaction.save
    end
    @group_entity.groups = @group
    @group_entity.entities = @transaction
   
    @group_entity.save
    redirect_to transactions_path
    
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
