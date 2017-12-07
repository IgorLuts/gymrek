class AttachmentsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
    @attachments = Attachment.uniq_by_product.page(params[:page])
  end
end
