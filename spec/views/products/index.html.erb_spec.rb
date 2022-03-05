require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        artist: "Artist",
        price: 2.5,
        vinyl_weight: 3,
        catalog_number: "Catalog Number",
        condition: "Condition",
        user: nil
      ),
      Product.create!(
        name: "Name",
        artist: "Artist",
        price: 2.5,
        vinyl_weight: 3,
        catalog_number: "Catalog Number",
        condition: "Condition",
        user: nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Artist".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Catalog Number".to_s, count: 2
    assert_select "tr>td", text: "Condition".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
