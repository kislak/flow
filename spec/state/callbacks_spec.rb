# frozen_string_literal: true

RSpec.describe State::Callbacks, type: :module do
  it_behaves_like "an example class with callbacks", described_class, :initialize
end
