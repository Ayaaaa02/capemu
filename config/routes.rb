Rails.application.routes.draw do
  #root 'cafes#top'

 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
   root 'cafes#top'
   get "/about" => "cafes#about"
   get "/customers/mypage" => "customers#show"
   get "/customers/information/edit" => "customers#edit"
   patch "/customers" => "customers#update"
   get "/reservations/new" => "reservations#new"
   post "/reservations/confirm" => "reservations#confirm"
   get "/reservations/thanks" => "reservations#thanks"
   post "/reservations" => "reservations#create"
    resources :cafes, only: [:index, :show] do
       resource :likes, only: [:create, :destroy]
    end
   end
   



# 店舗用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    resources :cafes, only: [:index, :new, :create, :show, :edit, :update]
    get "/reservations" => "reservations#index"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
