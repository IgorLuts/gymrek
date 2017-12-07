class ContactsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver_now
      flash[:notice] = "Сообщение от #{@contact.name} отправленно."
      redirect_to root_path
    else
      render :new
    end
  end

  def callback
    @contact = Contact.new(secure_params)
    UserMailer.callback(@contact).deliver_now
    redirect_to root_path
  end

  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content, :phone)
  end
end
