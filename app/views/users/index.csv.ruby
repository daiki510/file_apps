# frozen_string_literal: true

require "csv"

CSV.generate do |csv|
  csv_column_names = %w(name age gender created_at)
  csv << csv_column_names
  @users.each do |user|
    column_values = [
      user.name,
      user.age,
      user.gender,
      user.created_at
    ]
    csv << column_values
  end
end
