module AuthenticationHelper
  def login_as(user)
    mock_omni_auth_for(user)
    visit "users/auth/#{user.provider}/callback"
    expect(page).to have_content("#{user.name}")
  end

  def mock_omni_auth_for(user)
    mock_options = {
      uid: user.uid,
      provider: user.provider,
      info: {
        name: user.name,
        email: user.email,
        avatar_url: user.avatar_url
      },
      credentials: {
        token: user.token
      }
    }
    OmniAuth.config.add_mock(user.provider.to_sym, mock_options)
  end
end

