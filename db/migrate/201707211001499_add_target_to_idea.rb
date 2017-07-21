class AddTargetToIdea < ActiveRecord::Migration[5.1]
  def change
        add_column :ideas, :target, :integer
  end
end
