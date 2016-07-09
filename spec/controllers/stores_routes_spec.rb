require 'spec_helper'

describe "Routes" do
  describe "StoresController" do
    it "routes get index" do
      expect(:get => "stores").to route_to(
        :controller => "stores",
        :action => "index"
      )
    end

    it "routes get new" do
      expect(:get => "stores/new").to route_to(
        :controller => "stores",
        :action => "new"
      )
    end

    it "routes get show" do
      expect(:get => "stores/1").to route_to(
        :controller => "stores",
        :action => "show",
        :id => "1"
      )
    end

    it "routes post create" do
      expect(:post => "stores").to route_to(
        :controller => "stores",
        :action => "create"
      )
    end

    it "routes get edit" do
      expect(:get => "stores/1/edit").to route_to(
        :controller => "stores",
        :action => "edit",
        :id => "1"
      )
    end

    it "routes put update" do
      expect(:put => "stores/1").to route_to(
        :controller => "stores",
        :action => "update",
        :id => "1"
      )
    end

    it "routes delete destroy" do
      expect(:delete => "stores/1").to route_to(
        :controller => "stores",
        :action => "destroy",
        :id => "1"
      )
    end   
  end
end
