require 'spec_helper'

describe "slim_breadcrumb behaviour", js: true do

  before do
    visit root_path
  end

  describe "slim element #1" do
    
    it "should be invisible at first" do
      page.should_not have_selector( "#crumb1", visible: true )
    end

    for n in [0, 1, 2] 
      it "should appear after hovering the separators ##{n}" do
        find( "#crumb_sep#{n}" ).trigger( :mouseover )
        sleep 1.2
        page.should have_selector( "#crumb1", visible: true )
      end
    end

#    it "should *not* appear after hovering the separator #3" do
#      find( "#crumb_sep3" ).trigger( :mouseover )
#      sleep 1.2
#      page.should_not have_selector( "#crumb1", visible: true )
#    end

    it "should disappear after moving out the mouse" do
      find( "#crumb_sep1" ).trigger( :mouseover )
      sleep 1.2
      find( "#breadcrumb" ).trigger( :mouseout )
      page.should_not have_selector( "#crumb1", visible: true )
    end

    it "should appear after clicking on the separator #1 and disappear after mouseout" do
      find( "#crumb_sep1" ).trigger( :click )
      sleep 1.2
      page.should have_selector( "#crumb1", visible: true )
      find( "#breadcrumb" ).trigger( :mouseout )
      sleep 1.2
      page.should_not have_selector( "#crumb1", visible: true )
    end

    it "should appear after dblclick on separator #4, since all elements are shown after dblclick" do
      find( "#crumb_sep4" ).trigger( :dblclick )
      sleep 2.0
      page.should have_selector( "#crumb1", visible: true )
      find( "#breadcrumb" ).trigger( :mouseout )
      sleep 2.0
      page.should_not have_selector( "#crumb1", visible: true )
    end

  end

  describe "root element" do

  end

  describe "last element" do
    
    it "should be always visible, even if slim" do
      page.should have_selector( "#crumb5", text: "#5 (Slim Crumb)",  visible: true )
    end

  end

end

