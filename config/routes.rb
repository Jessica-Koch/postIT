Rails.application.routes.draw do
    resources :topics do
        resources :posts, except: [:index]
    end

    resources :users

    resources :topics do
        resources :sponsored_posts, except: [:index]
    end
    resources :questions

    get 'about' => 'welcome#about'

    get 'contact' => 'welcome#contact'

    get 'faq' => 'welcome#faq'



    root 'welcome#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
