class PatientsController < ApplicationController
  #layout "application"
  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show

    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # POST /patients
  # POST /patients.json
  def create


    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to  edit_admin_patient_path(@patient), notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy

    
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, @patient] }
      format.json { head :no_content }
    end
  end
end
