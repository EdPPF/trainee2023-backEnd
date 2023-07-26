Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'posts' do
        post 'create', to:'posts#create'
        get 'index', to:'posts#index'
        get 'show/:id', to:'posts#show'
        patch 'update/:id', to:'posts#update'
        delete 'delete/:id', to:'posts#delete'
      end

      scope 'categories' do
        post 'create', to:'categories#create'
        get 'index', to:'categories#index'
        get 'show/:id', to:'categories#show'
        patch 'update/:id', to:'categories#update'
        delete 'delete/:id', to:'categories#delete'
      end

      # scope 'feedbacks' do
      #   post 'create', to:'feedbacks#create'
      #   get 'index', to:'feedbacks#index'
      #   get 'show/:id', to:'feedbacks#show'
      #   patch 'update/:id', to:'feedbacks#update'
      #   delete 'delete/:id', to:'feedbacks#delete'
      # end

      # scope 'commentaries' do
      #   post 'create', to:'commentaries#create'
      #   get 'index', to:'commentaries#index'
      #   get 'show/:id', to:'commentaries#show'
      #   patch 'update/:id', to:'commentaries#update'
      #   delete 'delete/:id', to:'commentaries#delete'
      # end

      # scope 'users' do
      #   get 'login', to:'users#login'
      # end
    end
  end
end
