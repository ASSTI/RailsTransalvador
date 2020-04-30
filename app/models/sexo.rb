class Sexo < ApplicationRecord
  ##tablename
  self.table_name = "sex_sexo"
  ##primary_key
  self.primary_key = "sex_id_sex"

  validates :sex_id_sex, presence: false
  validates :sex_nom_sexo, presence: true

  #has_many :municipio , foreign_key: "mun_id_est"
  
  alias_attribute :id, "sex_id_sex"
  alias_attribute :nome, "sex_nom_sexo"
  
end


