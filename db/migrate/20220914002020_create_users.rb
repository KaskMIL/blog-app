class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo, default: 'https://api.lorem.space/image/face?w=150&h=150'
      t.text :bio, default: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'
      t.integer :postCounter, :default => 0

      t.timestamps
    end
  end
end
