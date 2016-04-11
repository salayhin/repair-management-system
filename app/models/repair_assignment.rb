class RepairAssignment < ActiveRecord::Base
  belongs_to :assigner, :class_name => "User", :foreign_key => :assigner_id
  belongs_to :assigned, :class_name => "User", :foreign_key => :assigned_id
  belongs_to :repair_order
  has_one  :repair_information
end
