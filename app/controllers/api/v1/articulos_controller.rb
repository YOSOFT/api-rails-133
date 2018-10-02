class ArticulosController < ApplicationController
    def index
        articulos = Articulo.order('created_at DESC')
        render json: { 
            status: 'SUCCESS', 
            message: 'Articulos cargados',
            data: articulos
        }, status: :ok
    end

    def show
        articulo = Articulo.find(params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Articulo encontrado',
            data: articulo
        }, status: :ok
    end

    def create
        articulo = Articulo.new(articulos_params)

        if articulo.save
            render json: {
                status: 'SUCCESS', 
                message: 'Articulo nuevo',
                data: articulo
            }, status: :ok
        else
            render json: {
                status: 'ERROR',
                message: 'Error creando articulo',
                data: articulo.errors
            }, status: :unprocessable_entity
        end

    end

    def destroy
        articulo = Articulo.find(params[:id])
        articulo.destroy
        render json: {
            status: 'SUCCESS',
            message: 'articulo eliminado',
            data: articulo
        }, status: :ok
    end

    def update
        articulo = Articulo.find(params[:id])
        if articulo.update_attributes(articulos_params)
            render json: {
            status: 'SUCCESS',
            message: 'articulo actualizado',
            data: articulo
            }, status: :ok
        else
            render json: {
                status: 'ERROR',
                message: 'articulo no actualizado',
                data: articulo
            }, status: :ok
        end
    end

    private 

    def articulos_params
        params.permit(:titulo, :contenido)
    end
end