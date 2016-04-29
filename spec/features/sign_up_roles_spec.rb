
describe "the sign up process", :type => :feature do

  it "signs up an Admin" do
    visit('/users/sign_up')
    fill_in('Name', :with => 'John Admin')
    fill_in('Email', :with => 'John@inter.net')
    fill_in('Password', :with => 'testtest')
    fill_in('Password confirmation', :with => 'testtest')
    select('admin', :from => 'Role')
    click_button('Sign up')

   expect(page).to have_content 'You have signed up successfully'

    visit('/about')
    expect(page).to have_content 'admin'
  end

  it "signs up a Moderator" do
    visit('/users/sign_up')
    fill_in('Name', :with => 'John Admin')
    fill_in('Email', :with => 'John@inter.net')
    fill_in('Password', :with => 'testtest')
    fill_in('Password confirmation', :with => 'testtest')
    select('moderator', :from => 'Role')
    click_button('Sign up')

   expect(page).to have_content 'You have signed up successfully'

    visit('/about')
    expect(page).to have_content 'moderator'
  end

  it "signs up a Moderator" do
    visit('/users/sign_up')
    fill_in('Name', :with => 'John Admin')
    fill_in('Email', :with => 'John@inter.net')
    fill_in('Password', :with => 'testtest')
    fill_in('Password confirmation', :with => 'testtest')
    select('user', :from => 'Role')
    click_button('Sign up')

   expect(page).to have_content 'You have signed up successfully'

    visit('/about')
    expect(page).to have_content 'user'
  end

end