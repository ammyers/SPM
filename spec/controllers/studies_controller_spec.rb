#rspec for testing models
require 'spec_helper'

RSpec.describe StudiesController, :type => :controller do
  describe 'creating study' do  
		context "with studies in the database" do
			before :each do 
				@test1 = FactoryGirl.create(:study, :title => 'test1')
				#@test1.studies << FactoryGirl.create(:study, :points=>1) #building fake models, not stubbing!
				@test2 = FactoryGirl.create(:study, :title => 'test2')
				#@jill.user_stories << FactoryGirl.create(:user_story, :points=>3)
			end
			describe "busiest developer" do
				it 'assigns the busiest developer' do
					get :index
					#expect(assigns(:busiest)).to eq(@jill)
				end
			end
 	 end
  end
end