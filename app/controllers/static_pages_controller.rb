class StaticPagesController < ApplicationController
  
  before_filter :signed_in_user, only: [:console]
  
  def home
  end

  def about
  end

  def contact
  end
  
  def console
  end

end
