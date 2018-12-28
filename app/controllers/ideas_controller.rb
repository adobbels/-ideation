class IdeasController < ApplicationController

skip_before_action :authenticate_user!

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
    @reviews = @idea.reviews
    @review = Review.new
  end

  def new
    @idea = Idea.new
    if user_signed_in?
      if current_user.profile.present?
      else
        redirect_to new_profile_path
        flash[:alert] = 'Please create a profile before submitting an idea.'
      end
    else
      redirect_to user_session_path
      flash[:alert] = 'Please log-in before submitting an idea.'
    end
  end

  def create
    @profile = current_user.profile
    @idea = Idea.new(idea_params)
    @idea.profile = @profile
    @idea.status = "Under Review"

    if @idea.save
     redirect_to idea_path(@idea)
     flash[:notice] = 'Your idea has been saved.'
    else
     render :new
    flash[:alert] = 'Please resubmit your idea.'
    end
  end


  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
  end

private

def idea_params
  params.require(:idea).permit(:title, :business_case, :value_prop, :target_market, :problem, :solution, :revenue, :status, :line)
end



end
