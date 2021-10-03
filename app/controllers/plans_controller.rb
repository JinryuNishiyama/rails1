class PlansController < ApplicationController
  before_action :today
  
  def index
    @plans = Plan.all.order(:date, :starting_time)
    @count = Plan.count
  end
  
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(params.require(:plan).permit(:title,:date,:starting_time,:ending_time,:note))
    if @plan.save
      flash[:notice] = "スケジュールを作成しました"
      redirect_to :plans
    else
      render "new"
    end
  end
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title,:date,:starting_time,:ending_time,:note))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :plans
    else
      render "edit"
    end
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :plans
  end
  
  def today
    @date = Date.current.strftime("%Y年%m月%d日")
  end
end
