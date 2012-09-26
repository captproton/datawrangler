class PeopleController < ApplicationController
## This controller should be nested within import_tables

  respond_to :html, :xml, :json
  # GET /people
  # GET /people.json
  def index
    
    if params[:import_table_id]
      @table = ImportTable.find(params[:import_table_id])
      # @search = @table.people.where(:disqualified => false).order(:last_name)
      @search = @table.people.search(params[:q])
      @people = @search.result
      @search.build_condition
    else
      # @search = Person.where(:disqualified => false).search(params[:q]).order(:last_name)
      @search = Person.search(params[:q])
      @people = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)
      @search.build_condition
      
      
    end
    respond_with(@people) do |format|
      format.csv { send_data @people.to_csv }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_with(@person)

  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_with(@person)
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def disqualify
    @people = Person.find(params[:person_ids])
    @people.each do |person|
      person.update_attributes!(params[:person].reject { |k,v| v.blank? })
    end
    flash[:notice] = "Updated people!"
    redirect_to people_path
  end
  
  def edit_multiple
    @people = Person.find(params[:person_ids])
  end

  def update_multiple
    @people = Person.find(params[:person_ids])
    @people.each do |person|
      person.update_attributes!(params[:person].reject { |k,v| v.blank? })
    end
    flash[:notice] = "Updated people!"
    redirect_to people_path
  end
  
  def advanced_search
    @search = Person.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @people  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @people
  end
  
end
