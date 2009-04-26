class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save
      flash[:notice] = "You've been subscribed!"
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def index
    @subscriptions = Subscription.all
  end
end
