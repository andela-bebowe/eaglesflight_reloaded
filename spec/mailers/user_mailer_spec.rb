require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    FactoryGirl.create(:flight)
    @booking = FactoryGirl.create(:booking_with_passengers)
    @user = FactoryGirl.create(:user)
  end
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
  let(:mail) { UserMailer.confirmation_email(@user, @booking) }
  let(:mail2) { UserMailer.update_email(@user, @booking)}

  describe "#confirmation_email" do
    it "should send an email" do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
    it "renders the subject" do
      expect(mail.subject).to eql "Booking Confirmation"
    end
    it "renders the receiver email" do
      expect(mail.to).to eql([@user.email])
    end
    it "renders the sender email" do
      expect(mail.from).to eql([ENV["GMAIL_USERNAME"]])
    end
    it "assigns name" do
      expect(mail.body.encoded).to match(@user.name)
    end
  end
  describe "#update_email" do
    it "should send an email" do
      expect { mail2.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
    it "renders the subject" do
      expect(mail2.subject).to eql "Booking Update"
    end
    it "renders the receiver email" do
      expect(mail2.to).to eql([@user.email])
    end
    it "renders the sender email" do
      expect(mail2.from).to eql([ENV["GMAIL_USERNAME"]])
    end
    it "assigns name" do
      expect(mail2.body.encoded).to match(@user.name)
    end
  end
end
