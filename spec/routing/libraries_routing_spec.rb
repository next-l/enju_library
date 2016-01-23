# == Schema Information
#
# Table name: libraries
#
#  id                    :integer          not null, primary key
#  name                  :string           not null
#  display_name          :text
#  short_display_name    :string           not null
#  zip_code              :string
#  street                :text
#  locality              :text
#  region                :text
#  telephone_number_1    :string
#  telephone_number_2    :string
#  fax_number            :string
#  note                  :text
#  call_number_rows      :integer          default(1), not null
#  call_number_delimiter :string           default("|"), not null
#  library_group_id      :integer          default(1), not null
#  users_count           :integer          default(0), not null
#  position              :integer
#  country_id            :integer
#  created_at            :datetime
#  updated_at            :datetime
#  deleted_at            :datetime
#  opening_hour          :text
#  isil                  :string
#  latitude              :float
#  longitude             :float
#

require "spec_helper"

describe LibrariesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/libraries" }.should route_to(:controller => "libraries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/libraries/new" }.should route_to(:controller => "libraries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/libraries/1" }.should route_to(:controller => "libraries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/libraries/1/edit" }.should route_to(:controller => "libraries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/libraries" }.should route_to(:controller => "libraries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/libraries/1" }.should route_to(:controller => "libraries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/libraries/1" }.should route_to(:controller => "libraries", :action => "destroy", :id => "1")
    end

  end
end
