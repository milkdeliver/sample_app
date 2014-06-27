require 'spec_helper'
describe "StaticPages" do

  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path } 
    let(:heading) { 'Sample App' }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"
    # it { should have_content('Sample App') }
    # it { should have_title(full_title('Home')) }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"

    # it { should have_content( 'Help') }  
    # it { should have_title (full_title('Help'))}
  end

  describe "About page" do
    before { visit about_path}
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
    # it { should have_content( 'About Us')}
    # it { should have_title (full_title('About Us'))}
  end

  describe "Contact" do
    before { visit contact_path}
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"

    # it { should have_title(full_title('Contact'))}
    # it { should have_selector( 'h1', text: 'Contact Page')}
  end

  describe "Sign Up" do
    before {visit signup_path}
    let(:heading) { 'Sign Up' }
    let(:page_title) { 'Sign Up' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do 
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    expect(page).to have_title(full_title('Home'))
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign Up'))
  end
end




