class StaticPagesController < ApplicationController
  def about

  end
  def contact

  end
  def follow

  end
  def home
    @product = current_user.products.build if signed_in?

  end
end
