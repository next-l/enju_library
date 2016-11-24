# == Schema Information
#
# Table name: accepts
#
#  id           :integer          not null, primary key
#  basket_id    :integer
#  item_id      :integer
#  librarian_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require "rails_helper"

describe AcceptsController do
  describe "routing" do

    it "routes to #index" do
      get("/accepts").should route_to("accepts#index")
    end

    it "routes to #new" do
      get("/accepts/new").should route_to("accepts#new")
    end

    it "routes to #show" do
      get("/accepts/1").should route_to("accepts#show", :id => "1")
    end

    it "routes to #create" do
      post("/accepts").should route_to("accepts#create")
    end

    it "routes to #destroy" do
      delete("/accepts/1").should route_to("accepts#destroy", :id => "1")
    end

  end
end
