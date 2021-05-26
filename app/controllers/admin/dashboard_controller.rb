class Admin::DashboardController < ApplicationController
   http_basic_authenticate_with name: ENV['admin_username'].to_s , password: ENV['admin_password'].to_s
  def show
  end
end
