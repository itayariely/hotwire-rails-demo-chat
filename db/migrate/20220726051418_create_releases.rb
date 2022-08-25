class CreateReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :releases do |t|
      t.date :release_date
      t.string :release_title
      t.text :release_description

      t.timestamps
    end
  end
end
