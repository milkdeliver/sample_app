require 'spec_helper'

describe "UserPages" do
  subject { page }		
  describe "signup page" do
  	before {visit signup_path}
    it { should have_content('Sign Up') }
    it { should have_title(full_title('Sign Up')) }
  end


  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end

  describe "signup" do
  	before { visit signup_path }

  	let(:submit) {"Create my account"}

  	describe "with invalid information" do
  	  it "should not create a user" do
  	  	expect { click_button submit }.not_to  change(User, :count)
  	  end

  		describe "after submission" do
	  	  before { click_button submit }
	 	  it { should have_title('Sign up')}
	      it { should have_content('error')}
	    end

  	end

  	describe "with valid information" do
  	  before do
  	  	fill_in "Name", with: "Example User"
  	  	fill_in "Email", with: "user@example.com"
  	  	fill_in "Password", with: "123456"
  	  	fill_in "Confirmation", with: "123456"
  	  end

  	  it "should create a user" do
  	  	expect { click_button submit }.do change(User, :count).by(1)
  	  end
  	end
  end
  	# describe "with invalid information" do
  	#   before do
  	#   	fill_in "Name", with "Example User"
  	#   	fill_in "Email", with "user@example.com"
  	#   	fill_in "Password", with "12345"
  	#   	fill_in "Confirmation", with "123456"
  	#   end
  	# end
end
