class MailsController < ApplicationController
  #layout "application"
  def index
    @mails = Mail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mails }
    end
  end

  # GET /mails/1
  # GET /mails/1.json
  def show
    @mail = Mail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail }
    end
  end

  # GET /mails/new
  # GET /mails/new.json
  def new
    @mail = Mail.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail }
    end
  end

  # POST /mails
  # POST /mails.json
  def create
    pic_name =[]

    @mail = Mail.new(params[:mail])

    respond_to do |format|
      if @mail.save
        format.html { redirect_to  edit_admin_mail_path(@mail), notice: 'Mail was successfully created.' }
        format.json { render json: @mail, status: :created, location: @mail }
      else
        format.html { render action: "new" }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /mails/1
  # DELETE /mails/1.json
  def destroy
    @mail = Mail.find(params[:id])
    @mail.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, @mail] }
      format.json { head :no_content }
    end
  end
end
