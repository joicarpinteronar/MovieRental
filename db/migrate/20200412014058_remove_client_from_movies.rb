class RemoveClientFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :client_id, :integer
  end
end
