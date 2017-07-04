class CreateShorturls < ActiveRecord::Migration[5.1]
  def change
    create_table :shorturls do |t|
      t.string :url, :null => false
      t.string :short_url, :null => false
      t.integer :convert_num, :default => 0

      t.timestamps
    end
  end
end
