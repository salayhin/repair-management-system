class ChangeStatusTypes < ActiveRecord::Migration
  def change

    ## Clear status fields to change string to boolean
    ActivityStatus.find_each do |as|
      as.status = false
      as.save!
    end

    DeviceProblem.find_each do |dp|
      dp.status = false
      dp.save!
    end

    DeviceStatus.find_each do |ds|
      ds.status = false
      ds.save!
    end

    FinalStatus.find_each do |fs|
      fs.status = false
      fs.save!
    end

    # Main migration start here

    change_column :activity_statuses, :status, :boolean, :default => false
    change_column :device_problems, :status, :boolean, :default => false
    change_column :device_statuses, :status, :boolean, :default => false
    change_column :final_statuses, :status, :boolean, :default => false
  end
end
