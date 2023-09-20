class Produto < ApplicationRecord

    belongs_to :departamento, optional: true
    validates :preco, presence: true
    validates :nome, presence: true
    validates :descricao, presence: true
    validates :quantidade, presence: true
end
