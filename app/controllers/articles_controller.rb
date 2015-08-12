class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    # objArray = Array.new
    #
    # @articles.each do |article|
    #   # @singleArticle = @articles.find_by(:id => article.id).image.url
    #   if !@articles.find_by(:id => article.id).image.nil?
    #     @singleArticle = @articles.find_by(:id => article.id).image.url
    #   else
    #     @singleArticle = {id:55}
    #   end
    #   objArray.push(title: article.title, content: article.content, image_url: article.image.url)
    # end
    #
    # respond_to do |format|
    #   # if @article.save
    #     format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #     format.json { render :json => objArray.to_json, status: :ok }
    #   # else
    #   #   format.html { render :new }
    #   #   format.json { render json: @article.errors, status: :unprocessable_entity }
    #   # end
    # end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def testMethod
  #   {title: self.title, content: self.content, author: self.autho, image_url: self.image.url}
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :content, :autho, :image)
  end

end