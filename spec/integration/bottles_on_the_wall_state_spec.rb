# frozen_string_literal: true

require_relative "../support/test_classes/bottles_on_the_wall_state"

RSpec.describe BottlesOnTheWallState, type: :state do
  subject { described_class.new(bottles_of: :test_fluid) }

  it { is_expected.to define_argument :bottles_of }
  it { is_expected.to define_option :number_to_take_down, 1 }
  it { is_expected.to define_option :output, [] }
  it { is_expected.to define_attribute :unused }
  it { is_expected.to validate_numericality_of(:number_to_take_down).is_greater_than_or_equal_to(0).only_integer }
end
