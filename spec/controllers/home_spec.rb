require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    let!(:movies) { FactoryBot.create_list :movie, 2 }
    
  	before { get :index }

  	it "returns a success response" do
	  	expect(response).to be_successful
  	end
    
  	it "assigns @movies" do
	  	expect(assigns(:movies)).to eq(movies)
  	end
    
  	it "renders the index template" do
	  	expect(response).to render_template(:index)
  	end
  end
end
