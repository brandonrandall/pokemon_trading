class Admin::RewardsController < ApplicationController
  before_action :require_admin

  def index
    @active_rewards = Reward.where(status: 1).order(:cost, :name)
    @inactive_rewards = Reward.where(status: 0).order(:cost, :name)
  end

  def new
    @reward = Reward.new
    @item_categories = PokemonRecord.item_categories
    @item_results = PokemonRecord.items_by_name_or_category(query_params)
    if @item_results.count > 50
      flash[:alert] = "There are more than 50 items. Implement pagination."
      @item_results[0..49]
    else
      @item_results
    end
  end

  def create
    rewards = new_rewards
    if rewards
      rewards.each { |reward| reward.save }
      redirect_to admin_rewards_path
    else
      ## error message
      ## flash[:error] = "The rewards you tried to created were not valid."
      redirect_to new_admin_reward_path
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end



  private

  def query_params
    params["item_list"]
  end

  def new_rewards
    rewards = []
    params[:rewards].each_pair do |reward_name, reward_cost|
      binding.pry
      rewards << Reward.new(name: reward_name, cost: reward_cost) if reward_cost.to_i > 0
    end
    rewards.empty? || any_invalid?(rewards) ? false : rewards
  end

  def any_invalid?(rewards)
    rewards.any? { |reward| reward.valid? == false }
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
