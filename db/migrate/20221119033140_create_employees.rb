# frozen_string_literal: true

# Adds the employee table
class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :manager, foreign_key: {
        to_table: :employees,
        name: :FK_employee_manager
      }
    end
  end
end
