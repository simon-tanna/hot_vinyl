require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyString",
      artist: "MyString",
      price: 1.5,
      vinyl_weight: 1,
      catalog_number: "MyString",
      condition: "MyString",
      user: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[artist]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[vinyl_weight]"

      assert_select "input[name=?]", "product[catalog_number]"

      assert_select "input[name=?]", "product[condition]"

      assert_select "input[name=?]", "product[user_id]"
    end
  end
end
