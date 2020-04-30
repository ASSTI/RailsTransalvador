class OrgaoEmissor < ApplicationRecord
  ##tablename
  self.table_name = "oem_orgao_emissor"
  ##primary_key
  self.primary_key = "oem_id_ome"

  validates :oem_id_ome, presence: false
  validates :oem_nom_orgao_emissor, presence: true

  #has_many :municipio , foreign_key: "mun_id_est"
  
  alias_attribute :id, "oem_id_ome"
  alias_attribute :nome, "oem_nom_orgao_emissor"
  
end


