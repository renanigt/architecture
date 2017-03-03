require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:valid_attributes) { { name: "Project 1", client: "Renan" } }
  let(:invalid_attributes) { { name: "", client: "Renan" } }
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

    context "with invalid params" do

      it "returns status unprocessable_entity" do
        post :create, format: :json, params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Project.create!(valid_attributes)

      delete :destroy, params: {id: project.to_param}
      expect(Project.find(project.to_param).archived).to be true
    end

  end

  describe "PUT #done" do
    it "change the project to done" do
      project = Project.create!(valid_attributes)

      put :done, params: {id: project.to_param}
      expect(Project.find(project.to_param).status).to eq("concluido")
    end

    it "should return status ok" do
      project = Project.create!(valid_attributes)

      put :done, params: {id: project.to_param}
      expect(response).to have_http_status(:ok)
    end

  end

  describe "PUT #update" do
    let(:project) { Project.create!(valid_attributes) }

    context "with valid params" do

      it "should update project" do
        post :update, format: :json, params: { id: project.id, project: new_attributes }
        project.reload
        expect(project.name).to eq("Project Updated")
        expect(project.client).to eq("Renan")
      end

    end

  end

end
