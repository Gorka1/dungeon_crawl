$game = GameObj.new

def tick args
  
    args.state.world.w      ||= 1280
    args.state.world.h      ||= 720
    args.outputs[:scene].w = args.state.world.w
    args.outputs[:scene].h = args.state.world.h
  
    args.outputs[:scene].solids << { x: 0, y: 0, w: args.state.world.w, h: args.state.world.h, r: 20, g: 60, b: 80 }
    $game.@main_player.update(args)
  
    args.outputs.sprites << { x: 0,
      y: 0,
      w: 1280,
      h: 720,
      path: :scene }
  end
