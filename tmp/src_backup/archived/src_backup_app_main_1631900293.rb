$gtk.reset
#$dragon.require('app/player.rb')
# TODO:
# -Make a top-down movement system
# -make a camera
#   -follows the player/rails
#   -changes setting based on player location
# -make a way to have maps
#require 'player.rb'

class PlayerObj
  def initialize
    @x_pos = 0
    @y_pos = 0
    @size = 32
  end

  def move(args)
    if args.inputs.directional_angle
      @x_pos += args.inputs.directional_angle.vector_x * 5
      @y_pos += args.inputs.directional_angle.vector_y * 5
      @x_pos  = @x_pos.clamp(0, args.state.world.w - @size)
      @y_pos  = @y_pos.clamp(0, args.state.world.h - @size)
    end
  end

  def update(args)
      move(args)
      render(args)
  end

  def render(args)
      args.outputs[:scene].solids << { x: @x_pos, y: @y_pos,
          w: @size, h: @size, r: 80, g: 155, b: 80 }
  end
end

$main_player = PlayerObj.new

def tick args
  
  args.state.world.w      ||= 1280
  args.state.world.h      ||= 720
  args.outputs[:scene].w = args.state.world.w
  args.outputs[:scene].h = args.state.world.h

  args.outputs[:scene].solids << { x: 0, y: 0, w: args.state.world.w, h: args.state.world.h, r: 20, g: 60, b: 80 }
  $main_player.update(args)

  args.outputs.sprites << { x: 0,
    y: 0,
    w: 1280,
    h: 720,
    path: :scene }
end
