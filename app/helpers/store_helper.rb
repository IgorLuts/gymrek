module StoreHelper
  def product_feature(features)
    return if features.nil? || features.empty?

    html = <<-HTML
    <div class="ribbon #{features}">
        <div class="theribbon">#{message(features)}</div>
        <div class="ribbon-background"></div>
    </div>
    HTML

    html.html_safe
  end

  private

  def message(features)
    case features
    when 'sale'
      'sale'
    when 'new'
      'new'
    when 'gift'
      'Free shipping'
    end
  end
end
