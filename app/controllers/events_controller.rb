class EventsController < ApplicationController
  before_action :set_user, only: [:index, :new]
  before_action :set_one_month, only: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @event = Event.new
  end
  
  def new
    @event = Event.new
  end

  def show
    
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  def edit
    
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :started_at, :finished_at)
    end
end