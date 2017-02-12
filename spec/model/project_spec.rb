require 'rails_helper'

RSpec.describe Project do

  let(:project) { Project.new(name: "Project 1") }

  describe "#done" do
    
    it "should has status 'concluido'" do
      project.done!
      expect(project.status).to eq("concluido")
      expect(project.conclusion_date).not_to be_nil
    end

  end

  describe "#archive" do

    it "should be archived" do
      project.archive!
      expect(project.archived).to be true
      expect(project.archived_date).not_to be_nil
    end

  end

end
