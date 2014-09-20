require 'rails_helper'

RSpec.describe "forums/new", :type => :view do
  before(:each) do
    assign(:forum, Forum.new(
      :name => "MyString",
      :description => "MyText",
      :user_id => 1
    ))
  end

  it "renders new forum form" do
    render

    assert_select "form[action=?][method=?]", forums_path, "post" do

      assert_select "input#forum_name[name=?]", "forum[name]"

      assert_select "textarea#forum_description[name=?]", "forum[description]"

      assert_select "input#forum_user_id[name=?]", "forum[user_id]"
    end
  end
end
