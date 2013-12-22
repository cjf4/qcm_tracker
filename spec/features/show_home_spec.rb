require 'spec_helper'

describe "Viewing the home page" do
  
  it "displays QCM Tracker" do
  	visit "/"

  	expect(page).to have_text("Queen City Media")
  end

  it "should have the right title" do
  	visit "/"

  	expect(page).to have_title("QCM")
  end

  it "should have a link to QCMNY home page" do
  	visit "/"

  	expect(page).to have_link("QCM Home")
  end
end