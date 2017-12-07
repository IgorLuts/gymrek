class UserMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: ['i.luts.aot@gmail.com'], subject: 'Website Contact')
  end

  def order_notification(order)
    @order = order
    mail(to: ['i.luts.aot@gmail.com'], subject: 'Order received')
  end

  def callback(contact)
    @contact = contact
    mail(to: ['i.luts.aot@gmail.com'], subject: 'Callback')
  end
end
