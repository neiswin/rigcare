class ContactBulkService < ApplicationService
  attr_reader :archive
  
  def initialize(archive_param)
    @archive = archive_param.tempfile
  end

  def call
    Zip::File.open(@archive) do |zip_file|
      zip_file.each do |entry|
        PhonebookContact.import contacts_from(entry), ignore: true
        
      end
      
    end
  end
  
private

  def contacts_from(entry)
    sheet = RubyXL::Parser.parse_buffer(entry.get_input_stream.read)[0]
    sheet.map do |row|
      cells = row.cells
      PhonebookContact.new department: cells[0]&.value.to_s,
                            position: cells[1]&.value.to_s,
                            first_name: cells[2]&.value.to_s,
                            last_name: cells[3]&.value.to_s,
                            surname: cells[4]&.value.to_s,
                            landline_phone_1: cells[5]&.value.to_s,
                            landline_phone_2: cells[6]&.value.to_s,
                            city_phone: cells[7]&.value.to_s,
                            work_mobile_phone: cells[8]&.value.to_s,
                            personal_mobile_phone_1: cells[9]&.value.to_s,
                            personal_mobile_phone_2: cells[10]&.value.to_s

    end
  end
end