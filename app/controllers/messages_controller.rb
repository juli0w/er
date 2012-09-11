class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])

    if @message.save
      flash[:notice] = "Mensagem enviada com sucesso!"
    else
      flash[:alert] = "Preencha todos os campos."
    end

    redirect_to root_path
  end
end