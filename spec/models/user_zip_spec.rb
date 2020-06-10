# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserZip, type: :model do
  describe "#generate" do
    before do
      @users = create_list(:user, 10)
    end

    it "zipファイルが生成されること" do
      zip_file = UserZip.new(@users).generate
      expect(File.extname(zip_file.path)).to eq ".zip"

      # zipファイルの中身を確認する
      Zip::File.open(zip_file.path) do |zipfile|
        zipfile.each_with_index do |entry, i|
          expect(entry.name).to eq "user_#{@users[i].id}.csv"
        end
      end
    end
  end
end
