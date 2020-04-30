class GrupoMenu < ApplicationRecord

  ##tablename
  self.table_name = "grm_grupo_menu"
  ##primary_key
  self.primary_key = "grm_id_grm"

  validates :grm_id_grm, presence: false
  validates :grm_id_gru, presence: true
  validates :grm_id_men, presence: true

  #has_many :municipio , foreign_key: "mun_id_est"
  #belongs_to :pais , foreign_key: "est_id_pai"
  
  alias_attribute :id, "grm_id_grm"
  alias_attribute :grupo, "grm_id_gru"
  alias_attribute :menu, "grm_id_men"

end
