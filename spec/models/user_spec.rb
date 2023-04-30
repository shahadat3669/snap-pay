require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Shahadat Hossain', email: 'shahadat366@gmail.com', password: '12345678') }

  before { subject.save }

  it 'validates the presence of email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
