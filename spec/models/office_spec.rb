require 'rails_helper'

RSpec.describe Office, type: :model do
  describe 'relationships' do
    it { should belong_to(:company).optional }
  end
end
