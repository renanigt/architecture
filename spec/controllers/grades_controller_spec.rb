require 'rails_helper'

RSpec.describe GradesController, type: :controller do

  let(:project) { Project.create!(name: "Project 1", client: "Renan") }
  let(:valid_attributes) { { grade: 8, project_id: project.to_param } }
  let(:invalid_attributes) { { grade: 8, project_id: nil } }

  describe "POST #create" do
    
    context "with valid params" do

      it "creates a new Grade" do
        post :create, format: :json, params: { grade: valid_attributes }
        expect(Grade.count).to eq(1)
      end

      it "returns @grade in json format" do
        post :create, format: :json, params: { grade: valid_attributes }
        expect(response.body).to eq(assigns(:grade).to_json)
      end

      it "returns status created" do
        post :create, format: :json, params: { grade: valid_attributes }
        expect(response).to have_http_status(:created)
      end

    end

    context "with valid params" do

      it "returns status unprocessable_entity" do
        post :create, format: :json, params: { grade: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end

  end

  describe "DELETE #destroy" do

    it "destroys the requested grade" do
      grade = Grade.create!(valid_attributes)

      delete :destroy, params: {id: grade.to_param}
      expect(Grade.find(grade.to_param).archived).to be true
    end

  end

  describe "PUT #update" do
    let(:grade) { Grade.create!(valid_attributes) }

    context "with valid params" do

      it "should update grade" do
        post :update, format: :json, params: { id: grade.id, grade: { grade: 6 } }
        grade.reload
        expect(grade.grade).to eq(6)
      end

    end

  end

end
