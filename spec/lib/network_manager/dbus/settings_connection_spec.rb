require 'spec_helper'

describe "NetworkManager::DBus::SettingsConnection" do
  before :each do
    @data = fixture('settings_connections.yml')
    @object_paths = object_paths_from_fixture('settings_connections.yml')
  end
  
  it "should have no properties" do
    network_manager_dbus_mock
    con = NetworkManager::DBus::SettingsConnection.new @object_paths.first
    lambda do
      con.properties
    end.should raise_error(DBusInterface::Object::NoPropertiesError)
  end
  
  it "should get settings" do
    network_manager_dbus_mock
    con = NetworkManager::DBus::SettingsConnection.new @object_paths.first
    con.settings.should == @data.first.last['settings']
  end
end
