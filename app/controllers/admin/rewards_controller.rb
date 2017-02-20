class Admin::RewardsController < ApplicationController
  before_action :require_admin

  def index
    @active_rewards = Reward.where(status: 1).order(:cost, :name)
    @inactive_rewards = Reward.where(status: 0).order(:cost, :name)
  end

  def new
    @item_categories = PokemonRecord.item_categories
    @item_results = PokemonRecord.items_by_name_or_category(query_params)
    if @item_results.count > 0
      @rewards = @item_results.map { |item| Reward.new(name: item) }
    end
  end

  def create
    params["rewards"].each do |data|
      if data.values.none? { |val| val.empty? } and Reward.new(reward_params(data)).valid?
        Reward.create(reward_params(data))
      end
    end
    redirect_to admin_rewards_path
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.update(reward_params(params[:reward]))
    redirect_to admin_rewards_path
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.update(status: 0)
    redirect_to admin_rewards_path
  end

  private

  def reward_params(params_subset)
    params_subset.permit(:name, :cost, :status)
  end

  def query_params
    params["item_list"]
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
