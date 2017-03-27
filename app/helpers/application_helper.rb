module ApplicationHelper

  def quid(price)
    number_to_currency(price, :unit => "£")
  end
  
end
