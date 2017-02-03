require 'rails_helper'

RSpec.describe GradesController, type: :controller do

  let(:valid_attributes) { { grade: 8 } }
  let(:project_valid_attributes) { { name: "Project 1", client: "Renan" } }

  describe "POST #create" do
    let(:project) { Project.create! project_valid_attributes }
    context "with valid params" do


      it "creates a new Grade" do
        # project = Project.create! project_valid_attributes

        post :create, format: :json, params: { grade: {grade: 8, project_id: project.to_param} }
        expect(Grade.count).to eq(1)
      end

      it "returns @grade in json format" do
        post :create, format: :json, params: { grade: { grade: 8, project_id: project.to_param } }
        expect(response.body).to eq(assigns(:grade).to_json)
      end

      it "returns status created" do
        post :create, format: :json, params: { grade: valid_attributes }
        expect(response).to have_http_status(:created)
      end

    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested grade" do
      grade = Grade.create! valid_attributes

      delete :destroy, params: {id: grade.to_param}
      expect(Grade.find(grade.to_param).archived).to be true
    end

  end

end
