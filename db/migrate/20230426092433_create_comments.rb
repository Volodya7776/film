class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :movie
      t.references :user

      t.timestamps
    end
  end
end
