class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.datetime :date
      t.datetime :starting_time
      t.datetime :ending_time
      t.string :note

      t.timestamps
    end
  end
end
