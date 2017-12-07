require 'rails_helper'

RSpec.describe Visitor, type: :model do
  it { should validate_presence_of :email }
  it { should allow_value('user@example.com').for(:email ) }
  it { should_not allow_value('user11example.com').for(:email ) }

  describe 'subscribed' do

    it 'should add info to logger' do
      visitor = Visitor.new(email: "test@test.ru")

      visitor.subscribe
      
      expect(Rails.logger).to receive(:info).with("Subscribed test@test.ru to MailChimp")
    end

  end

end