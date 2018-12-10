class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @idea = Idea.find(params[:idea_id])
    # authorize @review
    if user_signed_in?
      if current_user.profile.present?
      else
        redirect_to new_profile_path
        flash[:alert] = 'Please create a profile before posting a review.'
      end
    else
      redirect_to user_session_path
      flash[:alert] = 'Please log-in before posting a review.'
    end
  end

  def create
    @profile = current_user.profile
    @idea = Idea.find(params[:idea_id])
    @review = Review.new(review_params)
    # authorize @review

    #@review = current_user.reviews.build(review_params)
    #authorize @review
    @review.idea = @idea
    @review.profile = @profile

    if @review.rating > 5 || @review.rating < 0
      flash[:alert] = 'Rating must range between 0 and 5.'
      redirect_to idea_path(@idea)
    else
      if @review.save
        redirect_to idea_path(@idea)
      else
          redirect_to new_profile_path
          flash[:alert] = 'Please create a profile before posting a review.'
      end
    end
  end
end


private
  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
