# Camera Rendering, from example 7-7
def calc_scene_position args
  player = args.state.game.main_player
  result = { x: args.state.camera.x - (args.state.camera.x_target * args.state.camera.scale),
             y: args.state.camera.y - (args.state.camera.y_target * args.state.camera.scale),
             w: args.state.world.w * args.state.camera.scale,
             h: args.state.world.h * args.state.camera.scale,
             scale: args.state.camera.scale }

  return result if args.state.camera.show_empty_space == :yes

  if result.w < args.grid.w
    result.merge!(x: (args.grid.w - result.w).half)
  elsif (args.state.camera.x_target * result.scale) < args.grid.w.half
    result.merge!(x: 10)
  elsif (result.x + result.w) < args.grid.w
    result.merge!(x: - result.w + (args.grid.w - 10))
  end

  if result.h < args.grid.h
    result.merge!(y: (args.grid.h - result.h).half)
  elsif (result.y) > 10
    result.merge!(y: 10)
  elsif (result.y + result.h) < args.grid.h
    result.merge!(y: - result.h + (args.grid.h - 10))
  end

  result
end

def tick args
  args.state.game ||= GameObj.new
  args.state.world.w      ||= 1280
  args.state.world.h      ||= 720
  args.outputs[:scene].w = args.state.world.w
  args.outputs[:scene].h = args.state.world.h

  gen_level("test_lvl.txt", args)
  #blocks
  args.outputs[:scene].solids << { x: 0, y: 0, w: args.state.world.w, h: args.state.world.h, r: 20, g: 60, b: 80 }
  args.outputs[:scene].solids << { x: 200, y: 50, w: 50, h: 70, r: 100, g: 20, b: 120 }
  #defining the camera
  args.state.camera.x                ||= 640
  args.state.camera.y                ||= 300
  args.state.camera.scale            ||= 1.0
  args.state.camera.show_empty_space ||= :no
  #change these to whatever you want the camera to follow
  args.state.camera.x_target           = args.state.game.main_player.x_pos
  args.state.camera.y_target           = args.state.game.main_player.y_pos

  args.state.game.main_player.update(args)

  scene_position = calc_scene_position args
  args.outputs.sprites << { x: scene_position.x,
                            y: scene_position.y,
                            w: scene_position.w,
                            h: scene_position.h,
                            path: :scene }
  # args.outputs.sprites << { x: 0,
  #                           y: 0,
  #                           w: 1280,
  #                           h: 720,
  #                           path: :scene }
end
