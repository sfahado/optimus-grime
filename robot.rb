# frozen_string_literal: true

require_relative 'optimus_grime'

# Get grid_size from command line arguments
# +ARGV[0]+ and +ARGV[1]+ is the grid size of the OptimusGrime

grid_size = ARGV[0..1].map(&:to_i)

# Get cleaning_locations from command line arguments
# # +ARGV[2]+ to +ARGV[n-1]+ is the cleaning_locations of the OptimusGrime

cleaning_locations = ARGV[2..]

if ARGV[2..].length >= 2 && ARGV[2..].length.even?
  cleaning_locations = ARGV[2..].each_slice(2).map { |x, y| [x.to_i, y.to_i] }
end

puts OptimusGrime.new(grid_size, cleaning_locations).call
# optimus_grime 5x5 (1, 3) (4, 4）
