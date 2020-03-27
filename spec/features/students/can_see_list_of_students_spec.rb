require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can see an individual professors show page with list of students" do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: harry, professor: snape)
    ProfessorStudent.create(student: harry, professor: hagarid)
    ProfessorStudent.create(student: harry, professor: lupin)
    ProfessorStudent.create(student: malfoy, professor: hagarid)
    ProfessorStudent.create(student: malfoy, professor: lupin)
    ProfessorStudent.create(student: longbottom, professor: snape)

    visit "/students"

    expect(page).to have_content("#{harry.name}: 3")
    expect(page).to have_content("#{malfoy.name}: 2")
    expect(page).to have_content("#{longbottom.name}: 1")


    expect(page.all('.students')[0]).to have_content(malfoy.name)
    expect(page.all('.students')[1]).to have_content(harry.name)
    expect(page.all('.students')[2]).to have_content(longbottom.name)

  end
end




#
# User Story 3 of 4
# As a visitor,
# When I visit '/students'
# I see a list of students and the number of professors each student has.
# (e.g. "Draco Malfoy: 5"
#       "Nymphadora Tonks: 10")
