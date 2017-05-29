require 'rails_helper'

RSpec.describe Question, type: :model do
    let(:question) { Question.create!(title: 'my title', body: 'how are you?', resolved: false) }

    describe 'attributes' do
        it "has a title attribute" do
            expect(question).to have_attributes(title: 'my title')
        end

        it "has a body attribute" do
            expect(question).to have_attributes(body: 'how are you?')
        end

        it 'has a resolved attribute' do
            expect(question).to have_attributes(resolved: false)
        end
    end
end
