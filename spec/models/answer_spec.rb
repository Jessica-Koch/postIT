require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) { Question.create!(title: 'my title', body: 'how are you?', resolved: false) }

    let(:answer) { Answer.create!(body: 'this is the answer to everything', question: question) }

    describe 'attributes' do
        it "has a body attribute" do
            expect(answer).to have_attributes(body: 'this is the answer to everything')
        end
    end
end
