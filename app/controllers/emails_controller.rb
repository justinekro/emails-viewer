class EmailsController < ApplicationController
	before_action :all_emails, only: [:index, :create, :update, :destroy]
	before_action :set_emails, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def new
  	@email = Email.new
  end

  def unread
    @email = Email.find(params[:id])
    @email.read = false
    @email.save
    all_emails
  end

  def show
    all_emails
		@email = Email.find(params[:id])
    @email.read = true
    @email.save
  end

  def create
    @email  = Email.create(email_params)
  end

  def destroy
    @email.destroy
    redirect_to root_path
  end

  private

    def all_emails
      @emails = Email.all.sort { |a,b| b.created_at <=> a.created_at }
      @emails_unread = Email.where(read: false)
    end

    def set_emails
      @email = Email.find(params[:id])
    end

    def email_params
      params.permit(:object, :body, :read)
    end
end
