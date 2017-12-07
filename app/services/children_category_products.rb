class ChildrenCategoryProducts
  def initialize(category)
    @category = category
  end

  def products
    Product.where(id: product_ids)
  end

  private

  def product_ids
    children_categories_product_ids + category_product_ids
  end

  def children_categories_product_ids
    children_categories.inject([]) { |acc, elem| acc << elem.product_ids }.flatten
  end

  def children_categories
    return [] unless category.has_children?
    category.children
  end

  def category_product_ids
    category.product_ids
  end

  attr_accessor :category
end
