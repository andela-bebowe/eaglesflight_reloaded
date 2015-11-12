require "rails_helper"

RSpec.describe Identity, type: :model do
  describe Identity do
    it "does not create without a name" do
      expect(FactoryGirl.build(:invalid_identity)).not_to be_valid
    end
    it "does not creat with invalid email" do
      expect(FactoryGirl.build(:invalid_email)).not_to be_valid
    end
    it "creates with a name" do
      expect(FactoryGirl.build(:identity)).to be_valid
    end
    it "has one after creating one" do
      FactoryGirl.create(:identity)
      expect(Identity.count).to eq 1
    end
  end
end
