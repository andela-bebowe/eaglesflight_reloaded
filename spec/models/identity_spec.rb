require "rails_helper"

RSpec.describe Identity, type: :model do
  describe Identity do
    it "does not create without a name" do
      FactoryGirl.build(:invalid_identity).should_not be_valid
    end
    it "does not creat with invalid email" do
      FactoryGirl.build(:invalid_email).should_not be_valid
    end
    it "creates with a name" do
      FactoryGirl.build(:identity).should be_valid
    end
    it "has one after creating one" do
      FactoryGirl.create(:identity)
      Identity.count.should == 1
    end
  end
end
