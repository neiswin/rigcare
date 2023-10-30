class PhonebookContactsController < ApplicationController
  before_action :set_contact!, only: %i[destroy edit update]

  def create
    if params[:archive].present?
      ContactBulkService.call params[:archive]
      flash[:success] = 'Контакты импортированы'  
    else
      @contact = PhonebookContact.new contact_params
      if @contact.save
        flash[:success] = 'Контакт добавлен'
        redirect_to phonebook_contacts_path
        return
      else
        render :new
        return
      end
    end
    redirect_to phonebook_contacts_path 
  end

  def index
    respond_to do |format|
      format.html do
        if params[:query].present?
          search_query = "%#{params[:query]}%"
          @contacts = PhonebookContact.where("first_name ILIKE ? OR last_name ILIKE ?", search_query, search_query)
        else
          @contacts = PhonebookContact.all.order(department: :desc).reverse_order
        end
      end
      format.zip do
        respond_with_zipped_contact
      end
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = 'Контакт удалён'
    redirect_to phonebook_contacts_path
  end

  def edit
    
  end

  def new
    @contact = PhonebookContact.new
  end


  def update
    if @contact.update contact_params
      flash[:success] = 'Контакт обновлен'
      redirect_to phonebook_contacts_path
    else
      render :edit
    end
  end

  private

  def set_contact!
    @contact = PhonebookContact.find(params[:id])
  end

  def contact_params
    params.require(:phonebook_contact).permit(:first_name, :last_name, :surname,
                                    :department, :position,
                                    :landline_phone_1, :landline_phone_2, :city_phone,
                                    :work_mobile_phone ,:personal_mobile_phone_1 ,:personal_mobile_phone_2)
  end

  def respond_with_zipped_contact
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      PhonebookContact.order(created_at: :desc).each do |contact|
        zos.put_next_entry "contact_#{contact.id}.xlsx"
        zos.print render_to_string(
          layout: false, handlers: [:axlsx], formats: [:xlsx],
          template: 'phonebook_contacts/contact',
          locals: {contact: contact}
        )
      end
    end
    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: 'users.zip'
  end
end

