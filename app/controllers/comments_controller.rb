class CommentsController < ApplicationController

  before_filter :setup_blog_entry
  
  def create
    @comment = @blog_entry.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog_entry, :notice => 'Comment was successfully created.' }
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render @blog_entry }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  def index    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @blog_entry.comments }
    end
    
  end
  
  private
  
  def setup_blog_entry
    @blog_entry = BlogEntry.find(params[:blog_entry_id])
  end
  
end
