class UsersController < ApplicationController
  
  def new
    @user = User.new
    symbol_title = self.controller_name + '_' + self.action_name + '_' + 'title'
    @title  = t( symbol_title.to_sym )
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @title = @user.first_name
  end
  
end
