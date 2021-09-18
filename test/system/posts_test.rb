require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "visiting the posts index" do
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
    
    visit groups_path
    
    click_on "Group 1"
    click_on "New Post"
    fill_in "Title", with: "Post 1"
    fill_in "Detail", with: "Post 1 Description"
    fill_in "Rarity", with: "12"
    
    click_on "Create Post"
    
    click_on "New Post"
    fill_in "Title", with: "Post 2"
    fill_in "Detail", with: "Post 2 Description"
    fill_in "Rarity", with: "10"
    
    click_on "Create Post"
    
    visit groups_path
    click_on "Group 1"
    
    assert_selector "h3", text: "Posts"
    assert_text "Post 1"
    assert_text "Post 2"
  end
  
  test "create a new post" do
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
    
    visit groups_path
    
    click_on "Group 1"
    
    click_on "New Post"
    fill_in "Title", with: "Post 1"
    fill_in "Detail", with: "Post 1 Description"
    fill_in "Rarity", with: "12"
    click_button "Create Post"
    
    assert_text "Post created"
    assert_text "Post 1"
    assert_text "Post 1 Description"
  end
  
  test "logged out users cannot see posts" do
    visit groups_path
    
    assert_equal page.current_path, login_path
    assert_text "Please login"
  end
end
