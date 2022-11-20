# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it 'optionally belongs to a manager of class Employee' do
      is_expected.to belong_to(:manager)
        .class_name('Employee')
        .with_foreign_key(:manager_id)
        .inverse_of(:direct_subordinates)
        .optional
    end

    it 'can have many direct subordinates of class Employee' do
      is_expected.to have_many(:direct_subordinates)
        .class_name('Employee')
        .with_foreign_key(:manager_id)
        .inverse_of :manager
    end
  end
end
