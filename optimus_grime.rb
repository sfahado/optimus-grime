# frozen_string_literal: true

#
# The class holds the logic of cleaning the square-meter of the office
#
# When a size of the grid +size+ is given, returns the grid
# When a location of the grid +cleaning_locations+ is given, returns the grid point to clean.
# size = [10, 10]
# +size+ and +cleaning_locations+ should be the number
#
# A +OptimusGrime+ object is programmed to assist in cleaning the floor based on specified locations
#
class OptimusGrime
  attr_accessor :grid_size, :cleaning_locations, :instructions

  def initialize(size, locations)
    validate(:size, size)
    locations.each do |location|
      validate(:cleaning_locations, location)
    end

    @grid_size = size
    @cleaning_locations = locations
    @instructions = []
  end

  def call
    current_location = [0, 0]
    cleaning_locations.each do |location|
      @instructions += navigate_and_clean(current_location, location)
      current_location = location
    end
    @instructions.join('')
  end

  private

  # Returns +ArgumentError+ if +value+ is not even for the given +name+
  # only +size+ and +cleaning_locations+ check in this +validate+ helper.
  #
  # Examples:
  #
  #   validate(:size, size)              # => must be valid (ArgumentError)
  def validate(name, value)
    raise ArgumentError, "#{name.capitalize} must be valid" unless value.length.even?
  end

  # Returns +instruction+ if +points+ is available and robot can be able to clean.
  #
  # Accepts only +start+ and +target+ as arguments,
  # where both are arrays representing two points on the grid.
  #
  # Examples:
  #
  #   navigate_and_clean(start, target)              # => EWNSC
  #   navigate_and_clean(start, target)              # => ENNNC
  def navigate_and_clean(start, target)
    instruction = []
    dx = target[0] - start[0]
    dy = target[1] - start[1]

    # Move east with +dx+ times if +dx+ coordinate is positive.
    instruction += ['E'] * dx if dx.positive?

    # Move west with +dx+ times if +dx+ coordinate is negative.
    instruction += ['W'] * dx.abs if dx.negative?

    # Move north with +dy+ times if +dy+ coordinate is positive.
    instruction += ['N'] * dy if dy.positive?

    # Move south with +dy+ times if +dy+ coordinate is negative.
    instruction += ['S'] * dy.abs if dy.negative?

    # Clean the point determined by +dx+ and +dy+, where the robot is positioned on the grid.
    instruction.push('C')
  end
end
