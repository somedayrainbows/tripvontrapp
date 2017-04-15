require "rails_helper"


describe User, type: :model do
  it "user can be created as an admin" do
    user = create(:user)
    user.update(role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "user can be created as a default user" do
    user = create(:user)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
 end
end
