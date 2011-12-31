class UsersController < ApplicationController
  def new
    set_title_header_footer
  end

private

  def set_title_header_footer
    @title = t(:users_new_title)
    @header = t(:users_new_header)
    @footer = t(:users_new_footer)
  end
end
