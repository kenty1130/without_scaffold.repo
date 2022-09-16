class AddReferencesToMyThreads < ActiveRecord::Migration[7.0]
  def change
    add_reference :my_threads, :user, null: false, foreign_key: true
  end
end
