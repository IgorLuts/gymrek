# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://xn--80aal0a7a.xn--j1amh"

SitemapGenerator::Sitemap.create do
  def category_path(category)
    unless category.is_root?
      category_long_path category.parent, category
    else
      category_short_path category
    end
  end

  def category_product_path(product)
    unless product.category.is_root?
      category_product_long_path product.category.parent, product.category, product
    else
      category_product_short_path product.category, product
    end
  end

  add articles_path
  add products_path
  add new_contact_path

  Page.find_each do |page|
      add page_path(page.slug), :lastmod => page.updated_at
  end

  Article.find_each do |article|
      add article_path(article), :lastmod => article.updated_at
  end

  Product.find_each do |product|
      add category_product_path(product), :lastmod => product.updated_at
  end

  Category.find_each do |category|
    if category.active
      add category_path(category), :lastmod => category.updated_at
    end
  end

end
