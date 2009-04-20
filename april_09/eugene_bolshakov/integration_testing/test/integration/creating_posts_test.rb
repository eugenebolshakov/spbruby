require 'test_helper'

class CreatingPostsTest < ActionController::IntegrationTest

  test 'posts can be created' do
    get posts_path
    assert_response :success
    assert_select "a[href='#{new_post_path}']", 'New post'

    get new_post_path
    assert_response :success
    assert_select "form[action='#{posts_path}']" do
      assert_select "input[name='post[title]']"
      assert_select "textarea[name='post[body]']"
      assert_select "input[type='submit']"
    end

    post_via_redirect posts_path, :post => {
      :title => 'Integration testing',
      :body  => 'is tedious'
    }

    post = Post.find(:first, :order => 'id DESC')
    assert_equal post_path(post), path 
    assert_equal 'Post was successfully created.', flash[:notice]
    assert_match /Integration testing/, response.body
    assert_match /is tedious/, response.body
  end

  test 'posts can be created, webrat version' do
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
