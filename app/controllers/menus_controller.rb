class MenusController < ApplicationController
  def home
    @title  = t(:menus_home_title)
    @header = t(:menus_home_header)
    @footer = t(:menus_home_footer)
  end
  
  def contact
    @title = t(:menus_contact_title)
    @header = t(:menus_contact_header)
    @footer = t(:menus_contact_footer)
  end
  
  def about
    @title = t(:menus_about_title)
    @header = t(:menus_about_header)
    @footer = t(:menus_about_footer)
  end
end