SimplePayrollDemo::Application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :projects,       only: [:index, :show]
      resources :timesheets,     only: [:index, :show]
      resources :leave_requests, only: [:index, :show]
    end
  end
end