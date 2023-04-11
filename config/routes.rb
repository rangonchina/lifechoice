Rails.application.routes.draw do
  
# 顧客用
# URL /customers/sign_in ...
devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
  scope module: :user do
    root to: 'homes#top'
  end
  
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
