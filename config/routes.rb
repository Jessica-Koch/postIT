Rails.application.routes.draw do
    resources :topics do
        resources :posts, except: [:index]
        resources :sponsored_posts, except: [:index]
    end

    resources :post, only: [] do
        resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]
        post '/up-vote' => 'votes#up_vote', as: :up_vote
        post '/down-vote' => 'votes#down_vote', as: :down_vote
    end
    resources :users, only: [:new, :create, :show]
    post 'users/confirm' => 'users#confirm'

    resources :questions

    resources :sessions, only: [:new, :create, :destroy]
    get 'about' => 'welcome#about'

    get 'contact' => 'welcome#contact'


    root 'welcome#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
