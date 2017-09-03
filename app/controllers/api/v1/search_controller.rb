class Api::V1::SearchController < ApplicationController

  def search
    @donors = User.search(search_params).decorate
  end

  private

  def search_params
    @params = params.require(:search).permit(:name, :blood_type, :rh, :age_start, :age_end, :complex, :rang)
  end

end
