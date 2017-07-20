class CreateJoinTableIdeasUsersJoin < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ideas, :users, :table_name => :ideas_users_join do |t|
      # t.index [:idea_id, :user_id]
      # t.index [:user_id, :idea_id]
    end
  end
end
