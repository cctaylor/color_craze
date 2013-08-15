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

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
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
