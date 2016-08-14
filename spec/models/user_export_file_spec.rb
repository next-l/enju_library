# -*- encoding: utf-8 -*-
require 'rails_helper'
  
describe UserExportFile do
  fixtures :all
  
  it "should export users" do
    message_count = Message.count
    file = UserExportFile.new
    file.user = users(:admin)
    file.save
    file.export!
    #UserExportFileJob.perform_later(file).should be_truthy
    Message.count.should eq message_count + 1
    Message.order(:id).last.subject.should eq 'エクスポートが完了しました'
  end
end

# == Schema Information
#
# Table name: user_export_files
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  user_export_file_name    :string
#  user_export_content_type :string
#  user_export_file_size    :integer
#  user_export_updated_at   :datetime
#  executed_at              :datetime
#  created_at               :datetime
#  updated_at               :datetime
#
