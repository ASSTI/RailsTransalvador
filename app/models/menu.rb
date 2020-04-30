class Menu < ApplicationRecord
  ## ler:  https://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
  ##tablename
  self.table_name = "men_menu"
  ##primary_key
  self.primary_key = "men_id_men"

  #has_many :menu , foreign_key: "men_id_men" 
  #obs optional:true, para garantir a presença de foreigners keys nullable
  belongs_to :menu , optional:true, foreign_key: "men_id_men_pai" 

  
   
  validates :men_id_men,  presence: false
  validates :men_nom_menu,  presence: true
  validates :men_des_menu,  presence: false
  validates :men_htm_icon,  presence: false
  validates :men_nom_action,  presence: false
  validates :men_nom_controller,  presence: false
  validates :men_flg_menu_guest,  presence: true ,allow_blank:true
  validates :men_flg_menu_admin,  presence: true ,allow_blank:true
  validates :men_flg_modulo,  presence: true ,allow_blank:true
  validates :men_flg_ativo,  presence: true ,allow_blank:true
  validates :men_id_men_pai,  presence: false
  validates :men_num_posicao,  presence: true
  validates :men_nom_url,  presence: false
  validates :men_id_csi,  presence: false
  validates :men_nom_icon,  presence: false
  validates :men_nom_path,  presence: false
  validates :men_num_nivel,  presence: false
  validates :men_nom_collor,  presence: false

  alias_attribute :id, "men_id_men"
  alias_attribute :nome, "men_nom_menu"
  alias_attribute :descricao, "men_des_menu"
  alias_attribute :html_icon, "men_htm_icon"
  alias_attribute :action, "men_nom_action"
  alias_attribute :controller, "men_nom_controller"
  alias_attribute :is_guest, "men_flg_menu_guest"
  alias_attribute :is_admin, "men_flg_menu_admin"
  alias_attribute :modulo, "men_flg_modulo"
  alias_attribute :ativo, "men_flg_ativo"
  alias_attribute :menu_pai, "men_id_men_pai"
  alias_attribute :posicao, "men_num_posicao"
  alias_attribute :url, "men_nom_url"
  alias_attribute :csi, "men_id_csi"
  alias_attribute :icone, "men_nom_icon"
  alias_attribute :path, "men_nom_path"
  alias_attribute :nivel, "men_num_nivel"
  alias_attribute :cor, "men_nom_collor"  
  
  def exibe_menu 
    records_array = Menu.find_by_sql("select * from (
        select 
        m1.men_id_men as pai,
        m1.* from men_menu
        right join men_menu m1 on men_menu.men_id_men = m1.men_id_men_pai
        where m1.men_num_nivel = 1
        union all
        select
        m2.men_id_men_pai,
        m2.* from men_menu
        right join men_menu m2 on men_menu.men_id_men = m2.men_id_men_pai
        where m2.men_num_nivel = 2
        union all
        select 
        (select men_id_men_pai from men_menu where m3.men_id_men_pai = men_menu.men_id_men ) as pai,
        m3.* from men_menu
        right join men_menu m3 on men_menu.men_id_men = m3.men_id_men_pai
        where m3.men_num_nivel = 3
    ) a
    order by pai,men_id_men,men_num_nivel,men_num_posicao")
    return records_array 
  end   

  def varre_array(array,val)
    array.each do |x|    
         if x.id == val 
             @temp = x
             return @temp
         end  
         if x.children.is_a? Array 
            @temp = varre_array(x.children,val)
         else 
            @temp = nil 
         end      
    end
    return @temp;
 end
 # action para montar objeto treeview #
 def monta_menu
  @menu = Menu.new
  @valor = @menu.exibe_menu

  @rootmenu = { 
       id:"root",
       name: 'Escopo Geral',
       children: []
  }      
  @rootmenu["children"] = Array.new
        @valor.each do |p|   
          #@rootmenu["children"].push(p.men_id_men) # esta correto - na ordem
          ## Monta o primeiro nivel do treeview
          if p.men_id_men == p.pai
            @filho_struc = Struct.new(:id,:name,:nivel,:color,:modulo,:children);
            @filho1 = @filho_struc.new(
                p.men_id_men,
                p.men_nom_menu,
                p.men_num_nivel,
                p.men_nom_collor,
                p.men_flg_modulo,[]) 
               @rootmenu["children"].push(@filho1)
          end
          ## Monta o segundo nivel do treeview
          if p.men_id_men != p.pai && p.men_flg_modulo == false 
              @no_struc = Struct.new(:id,:name,:nivel,:color,:modulo,:children);
              @no = @no_struc.new(p.men_id_men,
                                  p.men_nom_menu,
                                  p.men_num_nivel,
                                  p.men_nom_collor,
                                  p.men_flg_modulo,
                                  []); 
              @index = @menu.varre_array(@rootmenu["children"],p.men_id_men_pai); 
              #@index["children"] = Array.new
              @index["children"].push(@no)
          end    
          ## Monta o terceiro nivel do treeview
          if p.men_flg_modulo == true 
              @interface_struct = Struct.new(:id,:name,:modulo,:caminho,:icon,:children)
              @interface = @interface_struct.new(
                  p.men_id_men,
                  p.men_nom_menu,
                  p.men_flg_modulo,
                  p.men_nom_path.strip,
                  p.men_nom_icon,
                  nil
              )     
              @index1 = @menu.varre_array(@rootmenu["children"],p.men_id_men_pai); 
              @index1["children"].push(@interface)
          end    
      end

    return @rootmenu
  end
 

end

# nova versao #  
    # men_id_men  int  IDENTITY (1,1) ,
	# men_nom_menu  varchar(300)  NOT NULL ,
	# men_des_menu  varchar(1000)  NULL ,
	# men_htm_icon  varchar(100)  NULL CONSTRAINT  D_dbo_men_menu_1 DEFAULT  NULL,
	# men_nom_action  varchar(300)  NULL CONSTRAINT  D_dbo_men_menu_2	 DEFAULT  NULL,
	# men_nom_controller  varchar(300)  NULL CONSTRAINT  D_dbo_men_menu_3 DEFAULT  NULL,
	# men_flg_menu_guest  bit  NOT NULL ,
	# men_flg_menu_admin  bit  NOT NULL ,
	# men_flg_modulo  bit  NOT NULL ,
	# men_flg_ativo  bit  NOT NULL ,
	# men_id_men_pai  int  NULL ,
	# men_num_posicao  int  NOT NULL ,
	# men_nom_url  varchar(1000)  NULL ,
	# men_id_csi  int  NULL ,
	# men_nom_icon  varchar(100)  NULL ,
	# men_nom_path  varchar(500)  NULL ,
	# men_num_nivel  int  NULL 
# versao antiga #
# [men_id_men] [int] IDENTITY(1,1) NOT NULL,
# 	[men_nom_menu] [varchar](500) NOT NULL,
# 	[men_modulo] [char](1) NOT NULL,
# 	[men_id_pai] [int] NULL,
# 	[men_icon_menu] [varchar](40) NULL,
# 	[men_path_menu] [varchar](50) NULL,
# 	[men_ativo] [char](1) NOT NULL,
# 	[men_seq_men] [int] NOT NULL,
# 	[men_nivel] [int] NOT NULL,
# 	[men_color] [varchar](20) NULL,

