Fabricator :user do
  email 'email@example.com'
  username 'default_user'
  password 'password'
end

Fabricator :blogger, from: :user do
  email 'blogger@example.com'
  blogger 'true'
end
