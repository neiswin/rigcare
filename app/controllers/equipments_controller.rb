class EquipmentsController < ApplicationController
  before_action :set_equipment!, only: %i[destroy edit show update]
  
  def create
    @equipment = Equipment.new equipment_params
    if @equipment.save
      flash[:success] = 'Оборудование добавлено'
      redirect_to equipments_path
    else
      render :new
    end
  end
  
  def index
    @equipments = Equipment.all
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def edit
  end

  def destroy
    @equipment.destroy
    flash[:success] = 'Оборудование удалено'
    redirect_to equipments_path
    
  end

  def update
    if @equipment.update equipment_params
      flash[:success] = 'Информация обновлена'
      redirect_to equipments_path
    else
      render :edit
    end
  end

  private

  def set_equipment!
    @equipment = Equipment.find params[:id]
  end

  def equipment_params
    params.require(:equipment).permit(:title, :manufacturer, :part_number, :description, :amount )
  end
end
