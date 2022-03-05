require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "Name",
      artist: "Artist",
      price: 2.5,
      vinyl_weight: 3,
      catalog_number: "Catalog Number",
      condition: "Condition",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Catalog Number/)
    expect(rendered).to match(/Condition/)
    expect(rendered).to match(//)
  end
end
