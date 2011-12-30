require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/', nil, { 'HTTP_ACCEPT_LANGUAGE' => 'fr' }
    response.should have_selector('title', :content => %(Acceuil))
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact', nil, { 'HTTP_ACCEPT_LANGUAGE' => 'fr' }
    response.should have_selector("title", :content => %(Contact))
  end
end
