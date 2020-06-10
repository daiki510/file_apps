# frozen_string_literal: true

class UserFilesController < ApplicationController
  def index
    @users = User.all.order(:id)
    zip_file = UserZip.new(@users).generate
    send_file zip_file.path, type: "application/zip", filename: "users_#{Time.now.strftime("%Y%m%d%H%M%S")}.zip"
  end
end
