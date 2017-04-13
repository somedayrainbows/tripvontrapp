require 'rails_helper'

RSpec.describe CartExperience, type: :model do
  it "has all attributes of Experience" do
    exp = create(:experience)
    ce = CartExperience.new("1", 2)

    expect(ce.title).to eq(exp.title)
    expect(ce.description).to eq(exp.description)
    expect(ce.cost).to eq(exp.cost)
    expect(ce.city).to eq(exp.city)
    expect(ce.image_path).to eq(exp.image_path)
  end
  it "can calculate subtotal for each cart experience" do
    exp = create(:experience)
    ce = CartExperience.new("1", 2)

    expect(ce.subtotal).to eq(exp.cost * 2)
  end
end
