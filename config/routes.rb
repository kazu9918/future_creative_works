Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
    resources :survey_responses, only: [:new, :create]
    get 'survey_analysis', on: :member
  end
end
