Rails.application.routes.draw do
  #get 'pais/index'
  scope "/api/" do
     resources :pais
     resources :gestao_pessoa
     resources :estado
     resources :municipio
     resources :estado_civil
     resources :sexo
     resources :orgao_emissor
     resources :menu
     resources :grupo
     resources :grupo_menu
     resources :usuario 
     #rota customizada#
     get 'exibe_menu', to: 'menu#exibe_menu'
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end