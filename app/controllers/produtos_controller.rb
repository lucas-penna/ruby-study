class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order :nome
        @produto_com_desconto = Produto.order(:preco).limit 1
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def update
        id = params[:id]
        @produto = Produto.find(id)
        valores = params.require(:produto).permit(:nome, :descricao, :departamento_id, :preco, :quantidade)
        if @produto.update valores
            flash[:notice] = "Produto atualizado com sucesso!"
            redirect_to root_path
        else
            @departamentos = Departamento.all
            render :new    
    end
    
    def edit
        id = params[:id]
        @produto = Produto.find(id)
        @departamentos = Departamento.all 
        render :new
    end


    def create
        valores = params.require(:produto).permit(:nome, :descricao, :departamento_id, :preco, :quantidade)
        @produto = Produto.new valores
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_path
    end

    def busca
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end


end
