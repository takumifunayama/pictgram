class AddTopicIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :topic_id, :integer
  end
end
