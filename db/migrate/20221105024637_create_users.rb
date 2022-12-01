class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title
      t.date :startday
      t.date :endday
      t.boolean :shuujitu
      t.string :memo

      t.timestamps
    end
  end
end
