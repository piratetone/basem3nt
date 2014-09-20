require 'rails_helper'

RSpec.describe "forums/index", :type => :view do
  before(:each) do
    assign(:forums, [
      Forum.create!(
        :name => "Name",
        :description => "MyText",
        :user_id => 1
      ),
      Forum.create!(
        :name => "Name",
        :description => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of forums" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
