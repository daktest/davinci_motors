require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    make_mustang

    expect(page).to have_content('1967 Ford Mustang created')
    mustang_expects
  end

  scenario 'can create a second car' do
    visit '/'

    make_mustang
    make_corvette
    mustang_expects
    corvette_expects
  end
end

feature 'Edit Cars' do
  scenario 'can edit an existing car' do
    visit '/'
    make_mustang
    click_link 'Edit', match: :first
    fill_in 'Price', with: '5000'
    click_button 'Update Car'
    expect(page).to have_css('td', text: '1967')
    expect(page).to have_css('td', text: 'Ford')
    expect(page).to have_css('td', text: 'Mustang')
    expect(page).to have_css('td', text: '5000')

  end
end

def make_mustang
  click_link 'New Car'
  fill_in 'Make', with: 'Ford'
  fill_in 'Model', with: 'Mustang'
  fill_in 'Year', with: '1967'
  fill_in 'Price', with: '2300'
  click_button 'Create Car'
end

def mustang_expects
  expect(page).to have_css('td', text: '1967')
  expect(page).to have_css('td', text: 'Ford')
  expect(page).to have_css('td', text: 'Mustang')
  expect(page).to have_css('td', text: '2300')
end

def make_corvette
  click_link 'New Car'
  fill_in 'Make', with: 'Chevrolet'
  fill_in 'Model', with: 'Corvette'
  fill_in 'Year', with: '2017'
  fill_in 'Price', with: '57000'
  click_button 'Create Car'
end

def corvette_expects
  expect(page).to have_css('td', text: '2017')
  expect(page).to have_css('td', text: 'Chevrolet')
  expect(page).to have_css('td', text: 'Corvette')
  expect(page).to have_css('td', text: '57000')
end
