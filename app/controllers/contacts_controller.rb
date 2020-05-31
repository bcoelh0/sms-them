class ContactsController < ApplicationController
  before_action :set_list
  before_action :set_contact, except: :create

  def create
    @contact = @list.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @list, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { redirect_to @list }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @contact.destroy
    redirect_to list_path(@list)
  end

  private

  def set_contact
    @contact = @list.contacts.find(params[:id])
  end

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :list_id)
  end
end
