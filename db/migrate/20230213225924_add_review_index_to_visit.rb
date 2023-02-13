class AddReviewIndexToVisit < ActiveRecord::Migration[7.0]
  def change
    add_index :visits, :review_id
  end
end
