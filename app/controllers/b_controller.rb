class BController < ApplicationController

  def start
    #if user_signed_in?
      #permit use

      @scenarios = Scenario.all
    #else
    #  redirect_to new_user_session

    #end
  end

  def node

    @node = Node.find(params[:id])
    respond_to do |format|
      format.json { render json: {
          :node => @node
      }}
    end

  end

  def next_nodes

    current_node = Node.find(params[:id])

    # Left
    @next_nodes_0 = Node.joins(:speaker).where("previous_node_id = ? AND nodes.scenario_id = ? AND speakers.speaker_type = ?", params[:id], current_node.scenario_id,0)
    # Right
    @next_nodes_1 = Node.joins(:speaker).where("previous_node_id = ? AND nodes.scenario_id = ? AND speakers.speaker_type = ?", params[:id], current_node.scenario_id,1)
    # Events
    @next_nodes_events = Node.joins(:speaker).where("previous_node_id = ? AND nodes.scenario_id = ? AND speakers.speaker_type = ?", params[:id], current_node.scenario_id,-1)

    respond_to do |format|
      format.json { render json: {
          :next_nodes_0 => @next_nodes_0,
          :next_nodes_1 => @next_nodes_1,
          :next_nodes_events => @next_nodes_events
          }
      }
    end


  end


  def tree

    @current_node = Node.find(params[:id])

    # find all previous nodes
    @tree = []
    @prev_id = @current_node.previous_node_id

    while @prev_id > 0
      @node_branch = Node.find(@prev_id)

      @tree.push(@node_branch)
      @prev_id = @node_branch.previous_node_id
    end

    @tree = @tree.reverse

    respond_to do |format|
      format.json { render json: {
          :current_node => @current_node,
          :node_tree => @tree
          }}
    end
  end


end
