# TODO:
# -Make a top-down movement system
# -make a camera
#   -follows the player/rails
#   -changes setting based on player location
# -make a way to have maps
require 'player.rb'

def tick args
  main_player = PlayerObj.new
  args.state.world.w      ||= 1280
  args.state.world.h      ||= 720
  main_player.update(args)
end
