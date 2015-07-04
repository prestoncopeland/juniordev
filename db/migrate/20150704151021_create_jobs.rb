class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :job_type
      t.text :description
      t.string :salary, default: 'DOE'
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
