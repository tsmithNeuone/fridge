class IngRecJoinsController < ApplicationController
  # GET /ing_rec_joins
  # GET /ing_rec_joins.json
  def index
    @ing_rec_joins = IngRecJoin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ing_rec_joins }
    end
  end

  # GET /ing_rec_joins/1
  # GET /ing_rec_joins/1.json
  def show
    @ing_rec_join = IngRecJoin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ing_rec_join }
    end
  end

  # GET /ing_rec_joins/new
  # GET /ing_rec_joins/new.json
  def new
    @ing_rec_join = IngRecJoin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ing_rec_join }
    end
  end

  # GET /ing_rec_joins/1/edit
  def edit
    @ing_rec_join = IngRecJoin.find(params[:id])
  end

  # POST /ing_rec_joins
  # POST /ing_rec_joins.json
  def create
    @ing_rec_join = IngRecJoin.new(params[:ing_rec_join])

    respond_to do |format|
      if @ing_rec_join.save
        format.html { redirect_to @ing_rec_join, notice: 'Ing rec join was successfully created.' }
        format.json { render json: @ing_rec_join, status: :created, location: @ing_rec_join }
      else
        format.html { render action: "new" }
        format.json { render json: @ing_rec_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ing_rec_joins/1
  # PUT /ing_rec_joins/1.json
  def update
    @ing_rec_join = IngRecJoin.find(params[:id])

    respond_to do |format|
      if @ing_rec_join.update_attributes(params[:ing_rec_join])
        format.html { redirect_to @ing_rec_join, notice: 'Ing rec join was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ing_rec_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ing_rec_joins/1
  # DELETE /ing_rec_joins/1.json
  def destroy
    @ing_rec_join = IngRecJoin.find(params[:id])
    @ing_rec_join.destroy

    respond_to do |format|
      format.html { redirect_to ing_rec_joins_url }
      format.json { head :no_content }
    end
  end
end
