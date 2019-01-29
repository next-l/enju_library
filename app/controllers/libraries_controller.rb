class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :edit, :update, :destroy]
  before_action :check_policy, only: [:index, :new, :create]

  # GET /libraries
  # GET /libraries.json
  def index
    sort = {sort_by: 'position', order: 'asc'}
    case params[:sort_by]
    when 'name'
      sort[:sort_by] = 'name'
    end
    sort[:order] = 'desc' if params[:order] == 'desc'

    query = @query = params[:query].to_s.strip
    page = params[:page] || 1

    @libraries = Library.search(include: [:shelves]) do
      fulltext query if query.present?
      paginate page: page.to_i, per_page: Library.default_per_page
      order_by sort[:sort_by], sort[:order]
    end.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @libraries }
    end
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show
    begin
      super
    rescue NoMethodError
    end

    respond_to do |format|
      format.html # show.html.erb
      format.html.phone
      format.json { render json: @library }
      format.js
    end
  end

  # GET /libraries/new
  def new
    @library = Library.new
    @library.library_group = LibraryGroup.first
    @library.country = LibraryGroup.site_config.country
    prepare_options

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library }
    end
  end

  # GET /libraries/1/edit
  def edit
    prepare_options
  end

  # POST /libraries
  # POST /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: t('controller.successfully_created', model: t('activerecord.models.library')) }
        format.json { render json: @library, status: :created }
      else
        prepare_options
        format.html { render action: "new" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /libraries/1
  # PUT /libraries/1.json
  def update
    if params[:move]
      move_position(@library, params[:move])
      return
    end

    respond_to do |format|
      if @library.update_attributes(library_params)
        format.html { redirect_to @library, notice: t('controller.successfully_updated', model: t('activerecord.models.library')) }
        format.json { head :no_content }
      else
        @library.name = @library.name_was
        prepare_options
        format.html { render action: "edit" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @library.destroy

    respond_to do |format|
      format.html { redirect_to libraries_url }
      format.json { head :no_content }
    end
  end

  private

  def set_library
    @library = Library.friendly.find(params[:id])
    authorize @library
  end

  def check_policy
    authorize Library
  end

  def library_params
    params.require(:library).permit(
      :name, :display_name, :short_display_name, :zip_code, :street,
      :locality, :region, :telephone_number_1, :telephone_number_2, :fax_number,
      :note, :call_number_rows, :call_number_delimiter, :library_group_id,
      :country_id, :opening_hour, :isil, :position
    )
  end

  def prepare_options
    @library_groups = LibraryGroup.all
    @countries = Country.order(:position)
  end
end
