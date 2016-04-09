class AddCorrectToUser < ActiveRecord::Migration
  def change
  	add_column :users, :type_1_correct, :integer, default: 0
  	add_column :users, :type_1_total, :integer, default: 0
  	add_column :users, :type_2_correct, :integer, default: 0
  	add_column :users, :type_2_total, :integer, default: 0
  	add_column :users, :type_3_correct, :integer, default:0
  	add_column :users, :type_3_total, :integer, default: 0
  end
end
