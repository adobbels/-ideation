class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = 'Profile was successfully created.'
      redirect_to profile_path(@profile)
    else
      flash[:notice] = 'Your profile has not been created, please update your profile later.'
      redirect_to root_path
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:notice] = 'Profile was successfully updated.'
      redirect_to profile_path(@profile)
    else
      flash[:notice] = 'Error.  Something went wrong.'
      render :edit
    end
  end

  private

  def profile_params
  params.require(:profile).permit(:first_name, :last_name)
  end

end
