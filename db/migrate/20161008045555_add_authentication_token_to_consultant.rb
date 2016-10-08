class AddAuthenticationTokenToConsultant < ActiveRecord::Migration
  def change
    add_column :consultants, :authentication_token, :string, :unique => true
  end
end
