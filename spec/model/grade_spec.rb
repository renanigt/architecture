require 'rails_helper'

RSpec.describe Grade do

  let(:grade) { Grade.new(grade: 8) }

  describe "#archive" do

    it "should be archived" do
      grade.archive!
      expect(grade.archived).to be true
      expect(grade.archived_date).not_to be_nil
    end

  end

end
