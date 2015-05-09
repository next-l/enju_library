# -*- encoding: utf-8 -*-
class LibraryGroupsController < ApplicationController
  load_and_authorize_resource

  # GET /library_groups
  # GET /library_groups.json
  def index
    @library_groups = LibraryGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @library_groups }
    end
  end

  # GET /library_groups/1
  # GET /library_groups/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library_group }
    end
  end

  # GET /library_groups/1/edit
  def edit
    @countries = Country.all
  end

  # PUT /library_groups/1
  # PUT /library_groups/1.json
  def update
    respond_to do |format|
      if @library_group.update_attributes(library_group_params)
        format.html { redirect_to @library_group, notice: t('controller.successfully_updated', model: t('activerecord.models.library_group')) }
        format.json { head :no_content }
      else
        @countries = Country.all
        format.html { render action: "edit" }
        format.json { render json: @library_group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def library_group_params
    params.require(:library_group).permit(
      :name, :display_name, :short_name, :my_networks,
      :login_banner, :note, :country_id, :admin_networks, :url,
      :max_number_of_results, :skip_mobile_agents,
      :book_jacket_source, :screenshot_generator, :erms_url,
      :allow_bookmark_external_url, # EnjuBookmark
      {
        :colors_attributes =>  [:id, :property, :code]
      }
    )
  end
end
