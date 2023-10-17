class ApplicationController < ActionController::Base
  def render_homepage
    render({ :template => "dice_templates/homepage" })
  end

  def dice_roll
    @number_of_dice = params.fetch("dice").to_i
    @how_many_sides = params.fetch("sides").to_i

    @rolls = []

    @number_of_dice.times do
      die = rand(1..@how_many_sides)

      @rolls.push(die)
    end

    render({ :template => "dice_templates/results" })
  end
end
