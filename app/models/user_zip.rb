# frozen_string_literal: true

class UserZip
  require "zip"
  require "csv"

  def initialize(users)
    @users = users
  end

  def generate
    tempfile = Tempfile.open(["user", ".zip"])
    Zip::OutputStream.open(tempfile.path) do |zos|
      @users.each do |user|
        zos.put_next_entry("user_#{user.id}.csv")
        zos.puts create_csv(user)
      end
    end
    tempfile
  end

  private
    def create_csv(user)
      CSV.generate do |csv|
        csv_column_names = %w(name age gender created_at)
        csv << csv_column_names
        column_values = [
          user.name,
          user.age,
          user.gender,
          user.created_at
        ]
        csv << column_values
      end
    end
end
