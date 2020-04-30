class EstadoCivil < ApplicationRecord
  ##tablename
  self.table_name = "esc_estado_civil"
  ##primary_key
  self.primary_key = "esc_id_esc"

  validates :esc_id_esc, presence: false
  validates :esc_nom_esc, presence: true

  #has_many :municipio , foreign_key: "mun_id_est"
  
  alias_attribute :id, "esc_id_esc"
  alias_attribute :nome, "esc_nom_esc"
  
end


