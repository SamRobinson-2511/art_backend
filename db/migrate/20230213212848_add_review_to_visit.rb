class AddReviewToVisit < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :review_id, :integer
  end
end
