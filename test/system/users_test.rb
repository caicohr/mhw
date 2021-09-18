require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Username", with: "Test Account Username"
    fill_in "Email", with: "test1@test.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    
    click_on "Sign up"
    
    assert_text "Account Created"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Signing up doesn't work with errors" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Username", with: "Test Account Username"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    
    click_on "Sign up"
    
    assert_text "fix the errors"
    assert_selector "nav", text: "Login"
    refute_selector "nav", text: "Logout"
  end
  
  test "Login with user works" do
    user = FactoryBot.create :user, email: "test@account.com", password: "password"
    
    visit login_path
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "password"
    
    click_on "Login"
    
    assert_text "Logged In"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Login with wrong password fails" do
    user = FactoryBot.create :user, email: "test@account.com", password: "password"
    
    visit login_path
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "oops"
    
    click_on "Login"
    
    assert_text "Invalid"
    assert_selector "nav", text: "Login"
  end
end
