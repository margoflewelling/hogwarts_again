require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can see an index of all professors" do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    expect(page).to have_content("Name: #{snape.name}")
    expect(page).to have_content("Specialty: #{snape.specialty}")
    expect(page).to have_content("Name: #{lupin.name}")
    expect(page).to have_content("Age: #{lupin.age}")

  end
end


    #
    # As a visitor,
    # When I visit '/professors',
    # I see a list of professors with the following information:
    # -Name
    # -Age
    # -Specialty
    # (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
