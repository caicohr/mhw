require "application_system_test_case"

class GroupsTest < ApplicationSystemTestCase
  test "index page shows all groups" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Username", with: "Test Account Username"
    fill_in "Email", with: "test1@test.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    
    click_on "Sign up"
    
    visit login_path
    fill_in "Email", with: "test1@test.com"
    fill_in "Password", with: "password"
    click_button "Login"
    
    visit groups_path
    
    click_on "New Group"
    
    fill_in "Name", with: "Group 1"
    fill_in "Description", with: "Group Description"
    
    click_on "Create Group"
    
    click_on "New Group"
    
    fill_in "Name", with: "Group 2"
    fill_in "Description", with: "Group Description"
    
    click_on "Create Group"
    
    visit groups_path
    
    assert_text "Group 1"
    assert_text "Group 2"
  end
end
