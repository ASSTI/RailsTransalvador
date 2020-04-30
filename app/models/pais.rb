class Pais < ApplicationRecord
    ##tablename
    self.table_name = "pai_pais"
    ##primary_key
    self.primary_key = "pai_id_pai"

    validates :pai_id_pai, presence: false
    validates :pai_nom_pais, presence: true
  
    has_many :estado , foreign_key: "est_id_pai"
    
    alias_attribute :id, "pai_id_pai"
    alias_attribute :nome, "pai_nom_pais"
    
end