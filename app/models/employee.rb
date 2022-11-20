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

  has_many :subordinates,
           ->(employee) { subordinates(employee.as_scope) },
           class_name: 'Employee',
           foreign_key: :ancestor_id

  def as_scope
    self.class.where id:
  end

  def self.subordinates(manager_scope = nil)
    manager_scope ||= Employee.where manager: nil

    sql = <<~SQL
      WITH RECURSIVE "managers" AS (
        #{manager_scope.to_sql}
      ), "managers_and_subordinates" AS (
        SELECT *, "id" AS "ancestor_id" FROM "managers"
        UNION
        SELECT "e"."id", "e"."name", "e"."manager_id", "s"."ancestor_id"
        FROM "employees" AS "e"
        INNER JOIN "managers_and_subordinates" AS "s" ON "s"."id" = "e"."manager_id"
      ) SELECT "managers_and_subordinates".*
      FROM "managers_and_subordinates"
      WHERE "id" != "ancestor_id"
      ORDER BY "ancestor_id", "manager_id", "id"
    SQL

    from "(#{sql}) AS \"employees\""
  end
end
