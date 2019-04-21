class MeditationsController < ApplicationController

def index
    @meditations = Meditation.search(params[:search]).paginate(page: params[:page])
    @user= current_user
end

end 
