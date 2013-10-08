require 'spec_helper'

describe Cosmetic do

  describe "#update_listings" do
    context "option type is colors" do
      context "colors has 3 color" do
        let!(:colors) {create :option_type, name: "colors"}
        let!(:red) {create :option_value, name: "red", option_type: colors}
        let!(:green) {create :option_value, name: "green", option_type: colors}
        let!(:blue) {create :option_value, name: "blue", option_type: colors}

        it "should create 3 listings" do
          cosmetic = create :cosmetic
          colors.purchasable = cosmetic
          colors.save

          lambda do
            cosmetic.save
          end.should change(cosmetic.listings, :count).by 3
        end
      end
    end
  end
end
