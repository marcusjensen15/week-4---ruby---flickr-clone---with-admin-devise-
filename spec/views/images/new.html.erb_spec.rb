require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    assign(:image, Image.new(
      :img => "MyString",
      :user_id => 1,
      :favorite => false
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "input[name=?]", "image[img]"

      assert_select "input[name=?]", "image[user_id]"

      assert_select "input[name=?]", "image[favorite]"
    end
  end
end
