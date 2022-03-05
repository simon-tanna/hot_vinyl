require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      artist: "MyString",
      price: 1.5,
      vinyl_weight: 1,
      catalog_number: "MyString",
      condition: "MyString",
      user: nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

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
