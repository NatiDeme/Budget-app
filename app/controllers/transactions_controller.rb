class TransactionsController < ApplicationController
  def index
    @transactions = GroupEntity.where(groups_id: params[:id])
    @group_id = params[:id]
    # puts 'sadasdasdas'
    # @transactions.each do |ne|
    #   puts ne.entities.name
    # end
    # # puts @transaction[0].entities
    # puts 'asdasdasdas'
  end
  def new
    @groups = Group.all
  end
  def create
    @keep = params[:id]
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
    redirect_to category_transactions_path
    
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
