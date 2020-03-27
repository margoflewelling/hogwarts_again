require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    visit '/professors'
  end

  it "can see an index of all professors" do
    expect(page).to have_content("Name: #{@snape.name}")
    expect(page).to have_content("Specialty: #{@snape.specialty}")
    expect(page).to have_content("Name: #{@lupin.name}")
    expect(page).to have_content("Age: #{@lupin.age}")
  end

  it "list of professor names is in alphabetical order" do
  expect(page.all('.professor')[0]).to have_content(@lupin.name)
  expect(page.all('.professor')[1]).to have_content(@snape.name)

  end
end
