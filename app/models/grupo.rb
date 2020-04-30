class Grupo < ApplicationRecord
  ##tablename
  self.table_name = "gru_grupo"
  ##primary_key
  self.primary_key = "gru_id_gru"

  validates :gru_id_gru, presence: false
  validates :gru_nom_grupo, presence: true
  validates :gru_url_padrao, presence: true

  has_many :usuario , foreign_key: "usu_id_gru"
  
  alias_attribute :id, "gru_id_gru"
  alias_attribute :nome, "gru_nom_grupo"
  alias_attribute :url, "gru_url_padrao"

end
