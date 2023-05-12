class ToolsController < ApplicationController
  protect_from_forgery except: :sample

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    tool_data = tool_params
    @tool = Tool.new(tool_data)

    if @tool.save
      redirect_to tools_path, success: 'Creado correctament'
    else
      render :new, error: "No es posible crear #{@tool.errors.full_messages.join(', ')}"
    end
  end

  def update
    tool = Tool.find(params[:id])

    if tool.update(tool_params)
      redirect_to tools_path, success: 'Actualizado correctament'
    else
      render :edit, error: 'No es posible actualizar'
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy!
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :status, :sko)
  end
end
