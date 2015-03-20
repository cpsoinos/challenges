class CreateTeamToJoinUsersAndProjects < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false
    end
  end
end
