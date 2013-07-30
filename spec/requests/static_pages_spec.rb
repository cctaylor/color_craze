require 'spec_helper'


describe "StaticPages" do

  let(:base_title) { "Color Craze" }

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Home')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe "Services page" do

    it "should have the h1 'Services'" do
      visit '/static_pages/services'
      page.should have_selector('h1', :text => 'Services')
    end

    it "should have the title 'Services'" do
      visit '/static_pages/services'
      page.should have_selector('title', :text => "#{base_title} | Services")
    end
  end


end
