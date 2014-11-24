#rspec for testing models
require 'rails_helper'

RSpec.describe Study, :type => :model do

	describe '#title and #description' do

	it "is invalid without a title" do
		title = FactoryGirl.build(:study, :title => nil) #test object
		expect(title).not_to be_valid #the test!
	end

	it "is invalid without a description" do
		description = FactoryGirl.build(:study, :description => nil) #test object
		expect(description).not_to be_valid #the test!
	end
end

	describe '#createstudy' do

	it "creates a study" do
		study = FactoryGirl.build(:study, :title => "Testing", :description => "This is a description",
			:max_participants => "60", :duration => "30")
		study.title.should == "Testing"
		study.description.should == "This is a description"
		study.max_participants.should == 60
		study.duration == 30
	end
end

end



