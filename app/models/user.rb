class User < ApplicationRecord
  has_secure_password

  has_many :purchases, foreign_key: :buyer_id, dependent: :nullify
  has_many :products, through: :purchases, dependent: :nullify
  has_many :reviews, dependent: :destroy

  before_validation :downcase_email

  validates :username, :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    format: VALID_EMAIL_REGEX


  def cart_count
    $redis.scard "cart#{id}"
  end

  def cart_total_price
    total_price = 0
    get_cart_products.each { |product| total_price+= product.price }
    total_price
  end

  def get_cart_products
    cart_ids = $redis.smembers "cart#{id}"
    Product.find(cart_ids)
  end

  def purchase_cart_products!
    get_cart_products.each { |product| purchase(product) }
    $redis.del "cart#{id}"
  end

  def purchase(product)
    products << product unless purchase?(product)
  end

  def purchase?(product)
    products.include?(product)
  end

  def has_payment_info?
    braintree_customer_id
  end

  private

  def downcase_email
    self.email&.downcase!
  end

end
