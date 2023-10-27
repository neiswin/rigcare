class PhonebookContactsController < ApplicationController

  def create
    if params[:archive].present?
      ContactBulkService.call params[:archive]
      flash[:success] = 'Contacts imported'  
    end
    redirect_to phonebook_contacts_path 
  end

  def index
    respond_to do |format|
      format.html do
        if params[:query].present?
          search_query = "%#{params[:query]}%"
          @contacts = PhonebookContact.where("first_name ILIKE ? OR last_name ILIKE ? OR surname ILIKE ?", search_query, search_query, search_query)
        else
          @contacts = PhonebookContact.all
        end
        
      end
      format.zip do
        respond_with_zipped_contact
      end
    end
  end

  private

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

