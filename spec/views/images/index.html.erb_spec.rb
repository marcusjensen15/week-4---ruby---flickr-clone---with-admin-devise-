require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :img => "Img",
        :user_id => 2,
        :favorite => false
      ),
      Image.create!(
        :img => "Img",
        :user_id => 2,
        :favorite => false
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
