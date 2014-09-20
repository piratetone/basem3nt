require 'rails_helper'

RSpec.describe "topics/show", :type => :view do
  before(:each) do
    @topic = assign(:topic, Topic.create!(
      :name => "Name",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
