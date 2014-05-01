SimplePayrollDemo::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, only: :sessions
      resources :projects,       only: [:index, :show]
      resources :timesheets,     only: [:index, :show]
      resources :leave_requests, only: [:index, :show]
    end
  end
end