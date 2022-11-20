# frozen_string_literal: true

# Represents any employee, whether it's the lowliest peon or the CEO.
class Employee < ApplicationRecord
  attribute :name, :string

  belongs_to :manager,
             optional: true,
             class_name: 'Employee',
             foreign_key: :manager_id,
             inverse_of: :direct_subordinates

  has_many :direct_subordinates,
           inverse_of: :manager,
           class_name: 'Employee',
           foreign_key: :manager_id
end
