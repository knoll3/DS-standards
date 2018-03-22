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
    
    # Get section
    case company_name
    when 'coserv'
      section = image_url.scan(/.+_([a-z]+)/)[0][0]
    when 'trinity_valley'
      section = image_url.scan(/.+_([a-z]+)/)[0][0]
    when 'tnmp'
      section = image_url.scan(/.+_(.+)-/)[0][0]
    when 'oncor'
      section = image_url.scan(/.+_(\d{3})/)[0][0]
    end

    # Build href
    file_path = "#{company_name}_#{section}.pdf"
    href = "https://#{bucket}.s3.amazonaws.com/standards/#{file_path}"
    if page
      href += "#page=#{page}"
    end
    return href
  end
  
  def get_name_from url
    url.scan(/(.+)_/)[0][0].sub('_',' ').upcase
  end
end