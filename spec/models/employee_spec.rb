require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :company }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :title }

    it { should validate_length_of(:name).is_at_least(5) }
  end
end
