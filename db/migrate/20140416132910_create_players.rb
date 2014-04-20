class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :rating
      t.integer :volatility

      t.timestamps
    end
  end
end
