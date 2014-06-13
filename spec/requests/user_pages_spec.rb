require 'spec_helper'

describe "UserPages" do
  subject {page}		
  describe "signup page" do
  	before {visit new_path}
    it { should have_content('Sign Up') }
    it { should have_title('Sign Up') }
  end
end
