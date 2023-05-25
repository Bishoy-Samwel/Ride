
describe "Filter Bikes", type: :feature do
  # before :each do
  #   load "#{Rails.root}/db/seeds.rb"
  # end

  scenario "User filter bikes" do
    road_style = Style.create(name: "Road")
    mountain_style = Style.create(name: "Mountain")

    Bike.create(name: "Road-Bike", price: 1, style: road_style)
    Bike.create(name: "Mountain-Bike", price: 2, style: mountain_style)

    visit "/bikes"

    fill_in "by_name", with: "Road"
    click_button "Submit"
    expect(page).to have_content("Road-Bike")
    expect(page).not_to have_content("Mountain-Bike")

    fill_in "by_name", with: "Mountain"
    click_button "Submit"
    expect(page).not_to have_content("Road-Bike")
    expect(page).to have_content("Mountain-Bike")
  end
end

