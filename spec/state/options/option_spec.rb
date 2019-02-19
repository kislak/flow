# frozen_string_literal: true

RSpec.describe State::Options::Option, type: :internal do
  describe "#initialize" do
    subject { instance.instance_variable_get(:@default_value) }

    shared_examples_for "a default value can be specified" do
      let(:default_value) { Faker::Lorem.word }

      it { is_expected.to eq default_value }
    end

    context "without a block" do
      let(:instance) { described_class.new(default: default_value) }

      it_behaves_like "a default value can be specified"

      context "with no default value" do
        let(:default_value) { nil }

        it { is_expected.to be_nil }
      end
    end

    context "with a block" do
      let(:instance) { described_class.new(default: default_value, &block) }
      let(:block) do
        -> { :default_value }
      end

      it_behaves_like "a default value can be specified"

      context "with no default value" do
        let(:default_value) { nil }

        it { is_expected.to eq block }
      end
    end
  end
end
# def initialize(default:, &block)
#   @default_value = (default_value.nil? && block_given?) ? block : default
# end
#
# def default_value
#   return instance_eval(&@default_value) if @default_value.respond_to?(:call)
#
#   @default_value
# end