class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_names
      t.string :last_names
      t.string :email
      t.string :phone
      t.string :password
      t.integer :status, default: 0
      t.boolean :singed
      t.integer :role

      t.timestamps
    end

    create_table :tools do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :tool_type

      t.timestamps
    end

    create_table :reservations do |t|
      t.datetime :reserved_at
      t.datetime :reserved_until
      t.integer :range
      t.references :user, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true

      t.timestamps
    end

    create_table :donations do |t|
      t.string :tool_name
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
