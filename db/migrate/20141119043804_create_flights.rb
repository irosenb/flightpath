class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
