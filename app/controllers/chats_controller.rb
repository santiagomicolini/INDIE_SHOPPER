class ChatsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    shop_user = @shop.user
    if @chat = current_user.chats.find { |chat| chat.users.include?(shop_user) }
      redirect_to shop_path(@shop)
    else
      @chat = Chat.new
      @chat.user = current_user
      if @chat.save
        current_user.chats << @chat
        shop_user.chats << @chat
        redirect_to chat_path(@chat)
      else
        render 'shops/show'
      end
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end
end
