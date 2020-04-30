class GestaoPessoa < ApplicationRecord
    ##tablename
    self.table_name = "gpe_gestao_pessoa"
    ##primary_key
    self.primary_key = "gpe_id_gpe"

    validates :gpe_id_gpe, presence: false
    validates :gpe_nom_pessoa, presence: true
    validates :gpe_nom_sobre_pessoa, presence: true
    validates :gpe_dat_nascimento, presence: true
    validates :gpe_dat_cadastro, presence: true
    validates :gpe_id_importacao_sigge, presence: false

    alias_attribute :id, "gpe_id_gpe"
    alias_attribute :nome, "gpe_nom_pessoa"
    alias_attribute :sobrenome, "gpe_nom_sobre_pessoa"
    alias_attribute :nascimento, "gpe_dat_nascimento"
    alias_attribute :cadastro, "gpe_dat_cadastro"
    alias_attribute :importacao, "gpe_id_importacao_sigge"
    
  end
  