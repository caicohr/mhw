class HomeController < ApplicationController
  def index
    @quests = Quest.all
  end
  
  def about
  end
end
