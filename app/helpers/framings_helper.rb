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

  def beautify_name company_name
    company_name.sub('_',' ').upcase
  end
  
end