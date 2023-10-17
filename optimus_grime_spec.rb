# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)

require 'optimus_grime'

RSpec.describe OptimusGrime do
  let(:valid_grid_ten) { [10, 10] }
  let(:valid_grid_five) { [10, 10] }
  let(:invalid_grid_ten) { [10] }
  let(:valid_locations) { [[1, 3], [4, 4], [6, 8], [1, 3], [-6, -6], [-10, -100], [1, 8]] }
  let(:valid_locations_one) { [[1, 3], [4, 4]] }
  let(:invalid_locations) { [[1, 3], [4, 4], [6, 8], [1, 3], [-6, -6], [-10, -100], [1]] }
  let(:valid_instructions) { 'ENNNCEEENC' }

  describe '#initialize' do
    context 'with valid arguments' do
      it 'creates an instance of OptimusGrime' do
        optimus_grime = OptimusGrime.new(valid_grid_ten, valid_locations)

        expect(optimus_grime).to be_an_instance_of(OptimusGrime)
      end
    end

    context 'with invalid size argument' do
      it 'raises ArgumentError' do
        expect do
          OptimusGrime.new(invalid_grid_ten, valid_locations)
        end.to raise_error(ArgumentError, 'Size must be valid')
      end
    end

    context 'with invalid cleaning_locations argument' do
      it 'raises ArgumentError' do
        expect do
          OptimusGrime.new(valid_grid_ten, invalid_locations)
        end.to raise_error(ArgumentError, 'Cleaning_locations must be valid')
      end
    end
  end

  describe '#call' do
    it 'returns a string of instructions' do
      optimus_grime = OptimusGrime.new(valid_grid_ten, valid_locations)

      instructions = optimus_grime.call

      expect(instructions).to be_a(String)
      expect(instructions.length).to be > 1
      expect(instructions).to include('E', 'W', 'N', 'S', 'C')
    end
  end

  describe '#call' do
    it 'returns a string of instructions' do
      optimus_grime = OptimusGrime.new(valid_grid_five, valid_locations_one)
      instructions = optimus_grime.call

      expect(instructions).to be_a(String)
      expect(instructions).to eq(valid_instructions)
      expect(instructions.length).to be > 1
      expect(instructions.length).to be(valid_instructions.length)
    end

    it 'same cleaning instructions as the points of cleaning' do
      optimus_grime = OptimusGrime.new(valid_grid_ten, valid_locations_one)
      instructions = optimus_grime.call
      expected_instructions = valid_locations_one.map { |_x, _y| 'C' }.join('')

      expect(instructions.count('C')).to eq(expected_instructions.length)
    end

    it 'returns same clean instructions as points of cleanings' do
      optimus_grime = OptimusGrime.new(valid_grid_five, valid_locations_one)
      instructions = optimus_grime.call

      expect(valid_grid_five.count).to be(instructions.count('C'))
    end
  end
end
