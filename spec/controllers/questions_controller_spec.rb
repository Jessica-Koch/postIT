require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
    let(:my_q) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_boolean) }

    let(:q_attributes){{title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_boolean }}
    describe "GET #index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end

        it "assigns [my_q] to @questions" do
            get :index
            expect(assigns(:questions)).to eq([my_q])
        end
    end

    describe "GET #show" do
        it "returns http success" do
            get :show, params:{id: my_q.id}
            expect(response).to have_http_status(:success)
        end

        it "renders the #show view" do
            get :show, params:{id: my_q.id}
            expect(response).to render_template :show
        end

        it "assigns my_q to @question" do
            get :show, params:{id: my_q.id}
            expect(assigns(:question)).to eq(my_q)
        end
    end

    describe "GET #new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end

        it "renders the #new view" do
            get :new
            expect(response).to render_template :new
        end

        it "instantiates @question" do
            get :new
            expect(assigns(:question)).not_to be_nil
        end
    end

    describe "GET #create" do
        it "returns http success" do
            get :create
            expect(response).to have_http_status(:success)
        end

        it "increases the number of Question by 1" do
            expect{post :create, params: {question: q_attributes}}.to change(Question, :count).by(1)
        end

        it "assigns the new question to @question" do
            post :create, params: {question: q_attributes}
            expect(assigns(:post)).to eq Question.last
        end

        it "redirects to the new question" do
            post :create, params: {post: q_attributes}
            expect(response).to redirect_to Question.last
        end
    end

    describe "GET edit" do
        it "returns http success" do
            get :edit, params:{id: my_q.id}
            expect(response).to have_http_status(:success)
        end

        it "renders the #edit view" do
            get :edit, params:{id: my_q.id}
            expect(response).to render_template :edit
        end

        it "assigns question to be updated to @question" do
            get :edit, params: {id: my_q.id}
            question_instance = assigns(:question)

            expect(question_instance.id).to eq my_q.id
            expect(question_instance.title).to eq my_q.title
            expect(question_instance.body).to eq my_q.body
            expect(question_instance.resolved).to eq my_q.resolved
        end
    end

    describe "PUT update" do
        it "updates the question with expected attributes" do
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph
            new_resolution = RandomData.random_boolean

            patch :update, params: {id: my_q.id, question:{title: new_title, body: new_body, resolved: new_resolution}}
            updated_question = assigns(:question)
            expect(updated_question.id).to eq my_q.id
            expect(updated_question.title).to eq my_q.title
            expect(updated_question.body).to eq my_q.body
            expect(updated_question.resolved).to eq my_q.resolved
        end

        it "redirects to the updated question" do
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph
            new_resolution = RandomData.random_boolean

            put :update, params: {id: my_q.id, question: {title: new_title, body: new_body, resolved: new_resolution}}
            expect(response).to redirect_to my_q
        end
    end

    describe "GET #destroy" do
        it "returns http success" do
            get :destroy
            expect(response).to have_http_status(:success)
        end

        it "deletes the question" do
            delete :destroy, params: {id: my_q.id}

            count = Question.where(id: my_q.id).size
            expect(count).to eq 0
        end

        it "redirects to questions index" do
            delete :destroy, params: {id: my_q.id}
            expect(response).to redirect_to questions_path
        end
    end

end
