require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:valid_attributes) { { name: "Project 1", client: "Renan" } }
  let(:new_attributes) { { name: "Project Updated", client: "Renan" } }

  describe "GET #index" do
    it "returns all projects not archived" do
      project = Project.create(name: "Project 1", archived: false)
      project_2 = Project.create(name: "Project 2", archived: true)

      get :index, format: :json
      expect(assigns(:projects)).to eq([project])
    end

  end

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Project" do
        post :create, format: :json, params: { project: valid_attributes }
        expect(Project.count).to eq(1)
      end

      it "returns @project in json format" do
        post :create, format: :json, params: { project: valid_attributes }
        expect(response.body).to eq(assigns(:project).to_json)
      end

      it "returns status created" do
        post :create, format: :json, params: { project: valid_attributes }
        expect(response).to have_http_status(:created)
      end

    end

  end

end
