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
    get "users/themes" => "themes#index"
    get "/goals/new/:theme_id" => "goals#new", as: "goals_new"
    get "/goals/all" => "goals#all_index", as: "goals_all"
    delete 'goal/:id' => 'goals#destroy', as: 'destroy_goal'
    resources :themes, only: [:index]
    resources :goals, only: [:new, :index, :show, :edit, :create]
    resources :users, only: [:show, :edit, :update]
    

  end
  
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
