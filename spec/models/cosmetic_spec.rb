require 'spec_helper'

describe Cosmetic do

  describe "after save" do
    context "option type is colors" do
      context "colors has 3 color" do
        let!(:colors) {create :option_type, name: "colors"}
        let!(:red) {create :option_value, name: "red", option_type: colors}
        let!(:green) {create :option_value, name: "green", option_type: colors}
        let!(:blue) {create :option_value, name: "blue", option_type: colors}

        it "should create 3 listings" do
        end
      end
    end
  end
end
