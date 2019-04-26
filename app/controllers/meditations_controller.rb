class MeditationsController < ApplicationController

def index
    @meditations = Meditation.search(params[:search]).paginate(page: params[:page]).order("created_at DESC")
    @user= current_user
end

end
