require 'rails_helper'

RSpec.describe "topics/new", :type => :view do
  before(:each) do
    assign(:topic, Topic.new(
      :name => "MyString",
      :user_id => 1
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do

      assert_select "input#topic_name[name=?]", "topic[name]"

      assert_select "input#topic_user_id[name=?]", "topic[user_id]"
    end
  end
end
