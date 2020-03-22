require 'rails_helper'

describe LibraryGroup do
  fixtures :library_groups

  it "should get library_group_config" do
    LibraryGroup.site_config.should be_truthy
  end

  it "should allow access from allowed networks" do
    library_group = LibraryGroup.find(1)
    library_group.my_networks = "127.0.0.1"
    library_group.network_access_allowed?("192.168.0.1").should be_falsy
  end
end

