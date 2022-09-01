class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.rename :email, :username
      t.remove :name
    end
  end
end
