Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :articles do
        collection do
          get 'search'
        end
      end
      resources :comments do
        collection do
          get 'search'
        end
      end
    end
  end
end
