module Saveable
  def serialize
    game = {}
    instance_variables.map do |state|
      game[state] = instance_variable_get(state)
    end
    JSON.dump(game)
  end

  def unserialize(saved_string)
    game = JSON.parse(saved_string)
    game.keys.each do |state|
      instance_variable_set(state, game[state])
    end
  end
end