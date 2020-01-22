require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :img => "Img",
      :user_id => 2,
      :favorite => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Img/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
