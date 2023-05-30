Rails.application.routes.draw do
  
# 顧客用
# URL /customers/sign_in ...
  devise_for :users, path: :user, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  # 会員側のルーティング設定
  scope module: :user do
    root to: 'homes#top'
    get "homes/about" => "homes#about", as: "about"
    get "users/themes" => "themes#theme_index"
    get "/goals/new/:theme_id" => "goals#new", as: "goals_new"
    get "/goals/all" => "goals#all_index", as: "goals_all"
    #　FIXME 複数形とパス修正する
    delete '/goals/:id' => 'goals#destroy', as: 'destroy_goal'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :themes, only: [:index]
    resources :goals, only: [:new, :index, :show,  :create]
    resources :users, only: [:show, :edit, :update]
    resources :goals, only: [:new, :create, :index, :show, :edit, :destroy] do
      resources :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      collection do
        get 'rate/:rate' => 'goals#rate', as: 'rate'
      end
    end
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  
   # 管理者側のルーティング設定
   namespace :admin do
   get '/' => 'homes#top'
   get "themes" => "themes#theme_index"
  # get 'admins/goals/:id' => 'goals#index' ,as: 'goals'
 
  # resources :genres, only: [:index, :create, :edit, :update]
   resources :users, only: [:index]
   resources :themes, only: [:destroy]
   resources :goals, only: [:index, :show] do
     resources :post_comments, only: [:destroy]
   end
 end
end
