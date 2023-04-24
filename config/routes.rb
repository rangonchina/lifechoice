Rails.application.routes.draw do
  
# 顧客用
# URL /customers/sign_in ...
devise_for :users, controllers: {
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
    get "/goals/new" => "goals#new"
    resources :themes, only: [:index]
    resources :goals, only: [:new, :show, :create]
    

  end
  
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
