class AddCommentIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :comment, index: true, foreign_key: true
  end
end
