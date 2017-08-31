class IndexController < ApplicationController

  def index
  end

  def donor_database
    @donors = User.donors.decorate
  end

  def contact
  end

end
