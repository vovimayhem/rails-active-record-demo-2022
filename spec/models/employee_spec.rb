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

  describe '.subordinates' do
    let(:example_manager) { create :employee, name: 'Example Manager' }
    let(:example_sub) { create :employee, name: 'Example Sub', manager: example_manager }
    let!(:example_sub_sub) { create :employee, name: 'Example Sub Sub', manager: example_sub }
    let(:example_manager_scope) { Employee.where id: example_manager.id }

    it 'returns an ActiveRecord relation' do
      expect(Employee.subordinates(example_manager_scope)).to be_a ActiveRecord::Relation
    end

    it 'includes all the descendant subordinates for the given manager scope' do
      expect(Employee.subordinates(example_manager_scope)).to include(example_sub, example_sub_sub)
    end

    it 'does not include the given manager(s) in the given scope' do
      expect(Employee.subordinates(example_manager_scope)).not_to include(example_manager)
    end
  end

  describe '#as_scope' do
    subject { create :employee }

    it 'returns an ActiveRecord relation' do
      expect(subject.as_scope).to be_a ActiveRecord::Relation
    end

    it 'contains self exclusively in the resultset' do
      expect(subject.as_scope).to match_array([subject])
    end
  end
end
