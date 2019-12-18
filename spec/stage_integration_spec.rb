require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a stage path', {:type => :feature}) do
  it('creates a stage and then goes to the stage page') do
    visit('/stages')
    save_and_open_page
    click_on('Add a New Stage')
    fill_in('stage_name', :with => 'Yellow Stage')
    click_on('Go!')
    expect(page).to have_content('Yellow Stage')
  end
end

describe('create a artist path', {:type => :feature}) do
  it('creates a stage and then goes to the stage page') do
    stage = Stage.new("Blue Stage", "West", nil)
    stage.save
    visit("/stages/#{stage.id}")
    save_and_open_page
    fill_in('artist_name', :with => 'Zedd')
    click_on('Add Artist')
    expect(page).to have_content('Zedd')
  end
end
