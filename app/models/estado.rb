class Estado < ApplicationRecord
  ##tablename
  self.table_name = "est_estado"
  ##primary_key
  self.primary_key = "est_id_est"

  validates :est_id_est, presence: false
  validates :est_nom_estado, presence: true
  validates :est_nom_sigla, presence: true

  has_many :municipio , foreign_key: "mun_id_est"
  belongs_to :pais , foreign_key: "est_id_pai"
  
  alias_attribute :id, "est_id_est"
  alias_attribute :nome, "est_nom_estado"
  alias_attribute :uf, "est_nom_sigla"
  #alias_attribute :pais, "est_id_pai"

end


