class ExperienceMailer < ApplicationMailer
  def submit_email(user, admin, experience)
    mail(to: [user.email, admin.email])

  end
end
