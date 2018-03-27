class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end

  def new
    @user_preference = UserPreference.new
    @categories = Category.all
    @cities = City.all
  end

  def create
    @user = current_user
    @user.categories.destroy_all
    params[:user_preference][:category_id].each do |params|
     unless params.empty?
       @user_preference = UserPreference.new
       @user_preference.category = Category.find(params)
       @user_preference.user = current_user
       @user_preference.save
     end
    end
    redirect_to root_path
  end
end
