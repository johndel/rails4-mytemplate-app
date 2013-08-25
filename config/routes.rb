TemplateApp::Application.routes.draw do

  devise_for :users

  namespace :admin do
    root to: "admin#index"
  end

  scope module: :front do

  end
end
