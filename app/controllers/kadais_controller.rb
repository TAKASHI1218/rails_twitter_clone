class KadaisController < ApplicationController
  before_action :set_kadai, only:[:show, :edit, :update, :destroy]

  def index
    @kadais = Kadai.all
  end

  def new
    @kadai = Kadai.new
  end

  def create
    @kadai = Kadai.new(kadai_params)
    if params[:back]
      render :new
    else
    if @kadai.save
      redirect_to new_kadai_path
    else
      render :new
    end
  end
end

  def show
  end

  def edit
  end

  def update
    if @kadai.update(kadai_params)
      redirect_to kadais_path
    else
      render :edit
    end
  end

  def destroy
    @kadai.destroy
    redirect_to kadais_path
  end

  def confirm
    @kadai = Kadai.new(kadai_params)
    render :new if @kadai.invalid?
  end

  private

  def kadai_params
    params.require(:kadai).permit(:content)
  end

  def set_kadai
    @kadai = Kadai.find(params[:id])
  end

end
