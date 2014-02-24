class BookstoresController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource except: :create
  authorize_resource only: :create

  def index
    @bookstores = Bookstore.page(params[:page])
  end

  def update
    @bookstore = Bookstore.find(params[:id])
    if params[:move]
      move_position(@bookstore, params[:move])
      return
    end
    update!
  end

  private
  def bookstore_params
    params.require(:bookstore).permit(
      :name, :display_name, :note
    )
  end
end
