require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "it has valid factory" do
      FactoryBot.create(:user).should be_valid
    end
    it "it invalid without a name"
    it "it invalid without a email"
    it "it invalid without a password"
  end
end
