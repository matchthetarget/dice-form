require "rails_helper"

describe "root URL" do
  it "has a level one heading with the text 'Dice Roll'", points: 1 do
    visit "/"

    expect(page).to have_tag("h1", text: /Dice\s+Roll/i)
  end
end

describe "/process_roll?dice=[RANDOM_DICE]&sides=[RANDOM_SIDES]" do
  it "has a level one heading with the text '[RANDOM_DICE]d[RANDOM_SIDES]'", points: 1 do

    random_dice = rand(100)
    random_sides = rand(100)

    visit "/process_roll?dice=#{random_dice}&sides=#{random_sides}"

    expect(page).to have_tag("h1", text: "#{random_dice}d#{random_sides}")
  end
end

describe "/process_roll?dice=[RANDOM_DICE]&sides=[RANDOM_SIDES]" do
  it "displays the outcome of rolling two six-sided dice in strong HTML elements in an ordered list", points: 1 do

    random_dice = rand(100)
    random_sides = rand(100)

    visit "/process_roll?dice=#{random_dice}&sides=#{random_sides}"

    expect(page).to have_tag("ol") do
      with_tag("strong", :text => /\d+/, :count => random_dice)
    end
  end
end
