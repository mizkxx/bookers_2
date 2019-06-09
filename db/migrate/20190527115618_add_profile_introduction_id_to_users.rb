class AddProfileIntroductionIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_introduction, :text
  end
end
