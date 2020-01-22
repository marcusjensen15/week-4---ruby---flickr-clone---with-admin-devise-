require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :img => "MyString",
      :user_id => 1,
      :favorite => false
    ))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do

      assert_select "input[name=?]", "image[img]"

      assert_select "input[name=?]", "image[user_id]"

      assert_select "input[name=?]", "image[favorite]"
    end
  end
end
