module AuthenticationHelper

  def login(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
  end

  def logout
    visit root_path
    click_link 'Logout'
  end

end
