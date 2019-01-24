module FramingsHelper

  def is_useful_column_name column_name
    nonuseful_column_names = %w[ id 
                                 created_at 
                                 updated_at
                               ]
    !nonuseful_column_names.include?(column_name) 
  end
  
  def prepend_s3 url
    "https://framing-helper-bucket-20180320.s3.amazonaws.com/#{url}"
  end
  
  def build_standards_href image_url, page = nil
    bucket = "framing-helper-bucket-20180320"
    
    # Get company name
    company_name = image_url.scan(/(.+)_/)[0][0]
    
    # Build href
    file_path = "#{company_name}.pdf"
    href = "https://#{bucket}.s3.amazonaws.com/standards/#{file_path}"
    if page
      href += "#page=#{page}"
    end
    return href
  end
  
  def get_name_from url
    url.scan(/(.+)_/)[0][0].sub('_',' ').upcase
  end

  def get_raw_name_from url 
    url.scan(/(.+)_/)[0][0]
  end

  def beautify_name company_name
    company_name.sub('_',' ').upcase
  end

  def get_row_count 
    count = 0
    Framing.all.each do |framing|
      framing_row = framing.row.to_i 
      if framing_row > count
        count = framing_row
      end
    end  
    return count
  end
  
  def is_company_name name
    noncompany_names = %w[ id
                           created_at
                           updated_at
                           desc
                         ]
    !noncompany_names.include?(name)
  end
  
  def is_blank value
    value == '-'
  end

  def goes_in_column column_name
    if column_name == 'desc'
      return true
    else
      if is_company_name column_name
       return Company.find_by(name: column_name).visible
      end 
    end
  end
  
  def create_pdf_link image
    bucket = "framing-helper-bucket-20180320"
    base_url = "https://s3.us-east-2.amazonaws.com/#{bucket}/standards/"
    "#{base_url}#{image.company}_#{image.section}.pdf#page=#{image.page}"
  end
end