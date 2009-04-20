require 'test_helper'

class CreatingPostsTest < ActionController::IntegrationTest

  test 'posts can be created' do
    visit posts_path
    click_link 'New Post'
    fill_in "Title", :with => "Webrat"
    fill_in "Body", :with => 'Is Awesome!'
    click_button "Create"
    assert_contain 'Post was successfully created'
    assert_contain 'Webrat'
    assert_contain 'Is Awesome!'
  end

end
