class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :pitch
      t.text :description
      t.string :image
      t.integer :campaign_duration
      t.text :who_we_need
      t.text :benefits_for_you

      t.timestamps
    end
  end
end
