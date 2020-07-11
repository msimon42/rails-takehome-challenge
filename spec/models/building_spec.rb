require 'rails_helper'

RSpec.describe Building, type: :model do
  describe 'relationships' do
    it { should have_many :offices }
  end
end
