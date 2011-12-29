class MenusController < ApplicationController
  def home
    @title = t(:title)
    @h1_header = t(:h1_header)
    @h3_footer = t(:h1_footer)
  end
end