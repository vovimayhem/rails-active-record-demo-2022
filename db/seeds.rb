# frozen_string_literal: true

#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ full_name: "Star Wars" }, { full_name: "Lord of the Rings" }])
#   Character.create(full_name: "Luke", movie: movies.first)

# Recreate the tree described in https://www.geeksforgeeks.org/postgresql-recursive-query
employee_one = Employee.find_or_create_by! name: 'M.S Dhoni'

employee_one_sub = Employee.create_with(manager: employee_one)
employee_two = employee_one_sub.find_or_create_by! name: 'Sachin Tendulkar'
employee_three = employee_one_sub.find_or_create_by! name: 'R. Sharma'
employee_four = employee_one_sub.find_or_create_by! name: 'S. Raina'
employee_one_sub.find_or_create_by! name: 'B. Kumar' # Employee 5

employee_two_sub = Employee.create_with(manager: employee_two)
employee_two_sub.find_or_create_by! name: 'Y. Singh' # Employee 6
employee_seven = employee_two_sub.find_or_create_by! name: 'Virender Sehwag'
employee_eight = employee_two_sub.find_or_create_by! name: 'Ajinkya Rahane'
employee_two_sub.find_or_create_by! name: 'Shikhar Dhawan' # Employee 9

employee_three_sub = Employee.create_with(manager: employee_three)
employee_three_sub.find_or_create_by! name: 'Mohammed Shami' # Employee 10
employee_three_sub.find_or_create_by! name: 'Shreyas Iyer' # Employee 11
employee_three_sub.find_or_create_by! name: 'Mayank Agarwal' # Employee 12
employee_three_sub.find_or_create_by! name: 'K. L. Rahul' # Employee 13

employee_four_sub = Employee.create_with(manager: employee_four)
employee_four_sub.find_or_create_by! name: 'Hardik Pandya' # Employee 14
employee_four_sub.find_or_create_by! name: 'Dinesh Karthik' # Employee 15

employee_seven_sub = Employee.create_with(manager: employee_seven)
employee_seven_sub.find_or_create_by! name: 'Jasprit Bumrah' # Employee 16
employee_seven_sub.find_or_create_by! name: 'Kuldeep Yadav' # Employee 17

employee_eight_sub = Employee.create_with(manager: employee_eight)
employee_eight_sub.find_or_create_by! name: 'Yuzvendra Chahal' # Employee 18
employee_eight_sub.find_or_create_by! name: 'Rishabh Pant' # Employee 19
employee_eight_sub.find_or_create_by! name: 'Sanju Samson' # Employee 20
