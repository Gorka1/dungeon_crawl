class PlayerObj
  attr_accessor :x_pos, :y_pos, :size

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