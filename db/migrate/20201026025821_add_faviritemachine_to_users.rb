class AddFaviritemachineToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favirite_machine, :string
  end
end
