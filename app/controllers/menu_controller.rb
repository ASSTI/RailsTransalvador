require 'ostruct'
class MenuController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @Menu = Menu.find(params[:id]) 
    render json: @Menu
  end

  def index
   @Menu = Menu.all  
   render json: @Menu  
  end

  #rota customizada#
  def exibe_menu
    @Menu = Menu.new 
    @valor = @Menu.monta_menu
    render json: @valor 
  end

  # def index_txt
  #   @menu = Menu.new
  #   @valor = @menu.exibe_menu

  #   @rootmenu = { 
  #        id:"root",
  #        name: 'Escopo Geral',
  #        children: []
  #   }      
  #   @rootmenu["children"] = Array.new
  #         @valor.each do |p|   
  #           #@rootmenu["children"].push(p.men_id_men) # esta correto - na ordem
  #           if p.men_id_men == p.pai
  #                @filho1 = OpenStruct.new({ 
  #                   id: p.men_id_men,
  #                   name: p.men_nom_menu,
  #                   nivel: p.men_num_nivel,
  #                   color: p.men_color_menu,
  #                   modulo: p.men_flg_modulo,
  #                   children:[]
  #                })
  #                @rootmenu["children"].push(@filho1)
  #           end
  #           if p.men_id_men != p.pai && p.men_flg_modulo == false 
  #                 @no = OpenStruct.new({ 
  #                        id: p.men_id_men,
  #                        name: p.men_nom_menu,
  #                        nivel: p.men_num_nivel, 
  #                        modulo: p.men_flg_modulo,
  #                        children:[]  
  #                  }); 
  #                 @index = varre_array(@rootmenu["children"],p.men_id_men_pai); 
  #                 @index["children"] = Array.new
  #                 @index["children"].push(@no)
  #           end    
  #           if p.men_flg_modulo == true 
  #               @interface = OpenStruct.new({ 
  #                   id: p.men_id_men,
  #                   name: p.men_nom_menu,
  #                   modulo: p.men_flg_modulo,
  #                   caminho: p.men_nom_path,
  #                   icon: p.men_nom_icon
  #               })    
  #               @index = varre_array(@rootmenu["children"],p.men_id_men_pai); 
  #               @index["children"] = Array.new
  #               @index["children"].push(@interface)
  #           end    
  #       end
  #   render json: @rootmenu
  # end

  # def varre_array(array,val)
  #    array.each do |x|    
  #         if x.id == val 
  #             @temp = x;
  #             return @temp; 
  #         end  
  #         if x.children.is_a? Array 
  #            @temp = varre_array(x.children,val);
  #         else 
  #            @temp = nil;  
  #         end      
  #    end
  #    return @temp;
  # end

  def update
    @Menu = Menu.find(params[:id])  
    if @Menu.update(menu_params)
      render json: @Menu
    else
      render json: @Menu.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @Menu = Menu.new(menu_params)
     if @Menu.save
       render json: @Menu, status: :created, location: @Menu
     else
       render json: @Menu.errors, status: :unprocessable_entity
     end
  end

  def menu_params
     params.require(:menu).permit(:men_id_men,
                                  :men_nom_menu,
                                  :men_des_menu,
                                  :men_htm_icon,
                                  :men_nom_action,
                                  :men_nom_controller,
                                  :men_flg_menu_guest,
                                  :men_flg_menu_admin,
                                  :men_flg_modulo,
                                  :men_flg_ativo,
                                  :men_id_men_pai,
                                  :men_num_posicao,
                                  :men_nom_url,
                                  :men_id_csi,
                                  :men_nom_icon,
                                  :men_nom_path,
                                  :men_num_nivel,
                                  :men_nom_collor)
  end   
end

