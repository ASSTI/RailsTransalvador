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
     #rotas customizada#
     get 'exibe_menu', to: 'menu#exibe_menu'
     get 'login', to: 'usuario#auth' # não usado pelo front-end,apenas para teste(segurança!!!)
     post 'login', to: 'usuario#auth'
     get 'login_pwd', to: 'usuario#auth_pwd' #não usado pelo front-end, apenas para teste(segurança!!!)
     post 'login_pwd', to: 'usuario#auth_pwd'
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end