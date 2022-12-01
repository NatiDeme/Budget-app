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
    @transaction.save if @transaction.valid?
    @group_entity.groups = @group
    @group_entity.entities = @transaction

    @group_entity.save
    redirect_to transactions_path(@group.id)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
