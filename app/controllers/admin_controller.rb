class AdminController < ApplicationController
  def login
    if request.post?
      if params[:name]=="vyshnavi" && params[:password]=="nimda"
        session[:admin]="admin"
        redirect_to :stores
        flash[:notice]="welcome admin"
      else
        
        render :action=>:login
        flash[:notice]="invalid credentials"
      end
    end
  end
  def logout
    session[:admin]=nil
    flash[:notice]="you are logged out"
    redirect_to :action=>:login
  end
end
