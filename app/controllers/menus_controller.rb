class MenusController < ApplicationController
  def home
    @title = %(Acceuil)
    @h1_header = t(:h1_header)
    @h3_footer = t(:h3_footer)
  end
  
  def contact
    @title = %(Contactez nous)
  end
  
  def about
    @title = %(A Propos)
  end
end