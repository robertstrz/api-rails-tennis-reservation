class ArticlesController < ApplicationController
  def new
  end

  def show
    @articles = Article.all
	@users = User.all
	arr1 = JSON.parse(@articles.to_json)
	arr2 = JSON.parse(@users.to_json)
	mrg = []
	arr1.each do |el1|
	  arr2.each do |el2|
	    if el2['id'] == el1['user_id']
	      mrg.push(el1.merge("user_name" => el2['name']))
	    end
	  end
	end



    respond_to do |format|
        format.html { redirect_to @articles, notice: 'User was successfully created.' }
        format.json do
        render :json => mrg
      end
    end
  end
end
