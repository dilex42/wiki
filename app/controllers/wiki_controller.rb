class WikiController < ApplicationController
  def show
    @page = Page.where(title: params[:title]).take
    if not @page or @page.text == ''
      redirect_to action: :edit
    end
  end

  def update
    @page = Page.where(title: params[:title]).take
    if not @page
      @page = Page.new
      @page.title = params[:title]
    end
    @page.text = params[:page][:text]
    if not @page.save
      render 'edit'
    else
      redirect_to action: :show
    end
  end

  def edit 
    @page = Page.where(title: params[:title]).take
    if not @page 
      @page = Page.new
    end
  end
  
  def about
  end
end
