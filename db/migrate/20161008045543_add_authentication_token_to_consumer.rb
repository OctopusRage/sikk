class AddAuthenticationTokenToConsumer < ActiveRecord::Migration
  def change
    add_column :consumers, :authentication_token, :string, :unique => true
  end
end
