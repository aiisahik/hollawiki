class ScenariosController < ApplicationController
  # GET /scenarios
  # GET /scenarios.json
  def index
    @scenarios = Scenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {
          :scenarios => @scenarios }
      }
    end
  end


  # GET /scenarios/1
  # GET /scenarios/1.json

  def show
    @scenario = Scenario.find(params[:id])

    @speakers = Speaker.where("scenario_id = ?", params[:id])
    @start_node = Node.where("scenario_id = ? AND previous_node_id = 0", params[:id])

    respond_to do |format|
      format.json { render json: {

          :scenario => @scenario,
          :speakers => @speakers,
          :start_node => @start_node.first

        }
      }
    end
  end


  # GET /scenarios/new
  # GET /scenarios/new.json
  def new
    @scenario = Scenario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scenario }
    end
  end

  # GET /scenarios/1/edit
  def edit
    @scenario = Scenario.find(params[:id])
  end

  # POST /scenarios
  # POST /scenarios.json
  def create
    @scenario = Scenario.new(params[:scenario])

    respond_to do |format|
      if @scenario.save

        @speakers = params[:speaker]
        @speakers.each do |speaker|
          if speaker[1] == "You"
            type = 0
          else
            type = 1
          end
          Speaker.create(:scenario_id => @scenario.id, :name => speaker[1], :speaker_type => type)
        end


        format.html { redirect_to @scenario, notice: 'Scenario was successfully created.' }
        format.json { render json: @scenario, status: :created, location: @scenario }
      else
        format.html { render action: "new" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scenarios/1
  # PUT /scenarios/1.json
  def update
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      if @scenario.update_attributes(params[:scenario])
        format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.json
  def destroy
    @scenario = Scenario.find(params[:id])
    @scenario.destroy

    respond_to do |format|
      format.html { redirect_to scenarios_url }
      format.json { head :no_content }
    end
  end
end
