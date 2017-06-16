require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
    num = Random.new
    ran_num = num.rand(100)
    let(:my_topic) { Topic.create!(name: Faker::Hipster.word, description: Faker::Hipster.paragraph(3))}
    let(:my_sp_post) {my_topic.sponsored_posts.create!(title: Faker::Hipster.sentence(1), body: Faker::Hipster.paragraph(1), price: ran_num)}

    describe "GET #show" do
        it "returns http success" do
            get :show, params: {topic_id: my_topic.id, id: my_sp_post.id}
            expect(response).to have_http_status(:success)
        end

        it "renders the #show view" do
            get :show, params: {topic_id: my_topic.id, id: my_sp_post.id}
            expect(response).to render_template :show
        end

        it "assigns my_sp_post to @sponsored_post" do
            get :show, params: {topic_id: my_topic.id, id: my_sp_post.id}
            expect(assigns(:sponsored_post)).to eq(my_sp_post)
        end
    end

    describe "GET #new" do
        it "returns http success" do
            get :new, params: {topic_id: my_topic.id}

            expect(response).to have_http_status(:success)
        end

        it "renders the #new view" do
            get :new, params: {topic_id: my_topic.id}
            expect(response).to render_template :new
        end

        it "instantiates @sponsored_post" do
            get :new, params: {topic_id: my_topic.id}
            expect(assigns(:sponsored_post)).not_to be_nil
        end
    end

    describe "POST #create" do
        it "increases the number of SponsoredPost by 1" do
            expect{post :create, params: {topic_id: my_topic.id, sponsored_post: {title: Faker::Hipster.sentence(1), body: Faker::Hipster.paragraph(1), price: ran_num}}, as: :json}.to change(SponsoredPost,:count).by(1)

        end

        it "assigns the new post to @post" do
            post :create, params: {topic_id: my_topic.id, sponsored_post: {title: Faker::Hipster.sentence(1), body: Faker::Hipster.paragraph(1), price: ran_num}}
            expect(assigns(:sponsored_post)).to eq SponsoredPost.last
        end

        it "redirects to the new post" do
            post :create, params: {topic_id: my_topic.id, sponsored_post: {title: Faker::Hipster.sentence(1), body: Faker::Hipster.paragraph(1), price: ran_num}}
            expect(response).to redirect_to [my_topic, SponsoredPost.last]
        end
    end

    describe "GET #edit" do
        it "returns http success" do
            get :edit, params: {topic_id: my_topic.id, id: my_sp_post.id}
            expect(response).to have_http_status(:success)
        end

        it "renders the #edit view" do
            get :edit, params: {topic_id: my_topic.id, id: my_sp_post.id}
            expect(response).to render_template :edit
        end

        it "assigns sponsored post to be updated to @sponsored_post" do
            get :edit, params: {topic_id: my_topic.id, id: my_sp_post.id}
            sp_instance = assigns(:sponsored_post)

            expect(sp_instance.id).to eq my_sp_post.id
            expect(sp_instance.title).to eq my_sp_post.title
            expect(sp_instance.body).to eq my_sp_post.body
            expect(sp_instance.price).to eq my_sp_post.price
        end
    end

    describe "PATCH #update" do
        it "updates sponsored post with expected attributes" do
            new_title = Faker::Hipster.word
            new_body = Faker::Hipster.paragraph(1)
            new_price = ran_num
            patch :update, params: {topic_id: my_topic.id, id: my_sp_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price}}

            updated_sp_post = assigns(:sponsored_post)
            expect(updated_sp_post.id).to eq my_sp_post.id
            expect(updated_sp_post.title).to eq new_title
            expect(updated_sp_post.body).to eq new_body
            expect(updated_sp_post.price).to eq new_price
        end

        it "redirects to the updated post" do
            new_title = Faker::Hipster.word
            new_body = Faker::Hipster.paragraph(1)
            new_price = ran_num

            patch :update, params: {topic_id: my_topic.id, id: my_sp_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price}}
            expect(response).to redirect_to [my_topic, my_sp_post]
        end
    end

    describe "DELETE destroy" do
        it "deletes the sponsored post" do
            delete :destroy, params: {topic_id: my_topic.id, id: my_sp_post.id}

            count = SponsoredPost.where(id: my_sp_post.id).size
            expect(count).to eq 0
        end

        it "redirects to sponsored posts index" do
            delete :destroy, params: {topic_id: my_topic.id, id: my_sp_post.id}
            expect(response).to redirect_to my_topic
        end
    end
end
