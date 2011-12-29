require 'spec_helper'

describe MenusController do
  render_views
  
  describe "GET :home" do
    before :each do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'fr'
    end
    
    it "should be successful" do
      get :home
      response.should be_success
    end
    
    it "should have the right title" do
      get :home
      response.should have_selector("title", :content => %(Acceuil))
    end
  end
  
  describe "GET :contact" do
    before :each do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'fr'
    end
    
    it "should be successful" do
      get :contact
      response.should be_success
    end
    
    it "should have the right title" do
      get :contact
      response.should have_selector("title", :content => %(Contactez nous))
    end
  end
  
  describe "GET :about" do
    before :each do
      @request.env['HTTP_ACCEPT_LANGUAGE'] = 'fr'
    end
    
    it "should be successful" do
      get :about
      response.should be_success
    end
    
    it "should have the right title" do
      get :about
      response.should have_selector("title", :content => %(A Propos))
    end
  end
end