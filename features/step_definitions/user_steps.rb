Given('the following users:') do |table|
  table.hashes.each do |user|
    user.transform_keys! { |key| key.downcase.to_sym }
    user[:gender] = user[:gender].downcase.to_sym

    User.create!(user)
  end
end

Given('I see the users list') do
  visit p(root_path)
end

When('I search for {string}') do |string|
  fill_in 'by_name', with: string
  click_on 'submit'
end

Then('I should see the following user:') do |table|
  users = all('table tbody tr').map do |row|
    {
      'Name' => row.find('.name').text,
      'Gender' => row.find('.gender').text,
      'Email' => row.find('.email').text,
    }
  end

  table.diff!(users)
end
