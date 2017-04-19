require 'rails_helper'

describe ExperienceMailer do
  describe ".submit_email" do
    it "sends an email to the user and admin" do
      user = create(:user)
      admin = create(:user)
      admin.update(role: 1)
      experience = create(:experience)
      expect(ExperienceMailer.submit_email(user, admin, experience).to ).to eq([user.email, admin.email])
    end

  end

end
