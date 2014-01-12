def sign_in(client, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = Client.new_remember_token
    cookies[:remember_token] = remember_token
    client.update_attribute(:remember_token, Client.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: client.email
    fill_in "Password", with: client.password
    click_button "Sign in"
  end
end