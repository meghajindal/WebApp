require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }

    end
  end
end
