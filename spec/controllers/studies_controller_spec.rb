require 'spec_helper'

RSpec.describe StudiesController, :type => :controller do
  describe 'creating study' do  
    it 'should call the model method that performs creation'
    it 'should select the Search Results template for rendering'
    it 'should make the TMDb search results available to that template'
  end
end