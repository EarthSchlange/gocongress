require "spec_helper"

describe Shirt do
  it_behaves_like "a yearly model"

  it "has a valid factory" do
    build(:shirt).should be_valid
  end
end
