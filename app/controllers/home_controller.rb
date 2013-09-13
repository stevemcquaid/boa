class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def faq
  end

  def contact_list
  end

  def phone_numbers
  end
  
  def milestones
  end
  
end
