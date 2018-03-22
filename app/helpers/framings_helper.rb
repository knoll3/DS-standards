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
  
  def build_standards_href file_path, page_href = nil
    href = ''
    bucket = "framing-helper-bucket-20180320"
    href = "https://#{bucket}.s3.amazonaws.com/standards/#{file_path}"
    if page_href
      href += page_href
    end
    return href
  end
  
  def get_name_from url
    url.scan(/(.+)_/)[0][0].sub('_',' ').upcase
  end
end