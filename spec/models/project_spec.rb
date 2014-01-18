require 'spec_helper'

describe "A project" do
  before do
  	@project = Project.new(month: "January", year: 2014, seo: 10, sales: 15,
  																					 socialmedia: 55.75, web_design: 2, creative_design: 0)
  end

  subject { @project }

  it { should respond_to(:month) }
  it { should respond_to(:year) }
  it { should respond_to(:seo) }
  it { should respond_to(:sales) }
  it { should respond_to(:socialmedia) }
  it { should respond_to(:web_design) }
  it { should respond_to(:creative_design) }

  it { should belong_to(:client) }
  	
end
