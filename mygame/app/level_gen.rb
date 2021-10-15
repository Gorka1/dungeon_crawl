# idea:
# read the whole file, drawing a 32x32 square for each char
# 0: red, 1: blue

# def gen_level file_name, args
#     level_file = File.open("data/#{file_name}")
#     total_file_data = []
#     File.foreach("data/#{file_name}") { |line|
#         total_file_data.add(line)
#     }
#     total_file_data.reverse!()
#     y = 0
#     total_file_data do line
#         x = 0
#         line do char
#             if char == '0':
#                 args.outputs[:scene].solids << { x: x * 64, y: y * 64, w: 64, h: 64, r: 255, g: 0, b: 0 }
#             elsif char == '1':
#                 args.outputs[:scene].solids << { x: x * 64, y: y * 64, w: 64, h: 64, r: 0, g: 0, b: 255 }
#             end
#             x += 1
#         end
#         y += 1
#     end
# end