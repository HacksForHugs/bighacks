class AddRewardToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :reward, :integer, default: 5
  	add_column :questions, :penalty, :integer, default: -5
  end
end
