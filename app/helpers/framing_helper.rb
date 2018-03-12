module FramingHelper

  def is_useful_column_name column_name
    nonuseful_column_names = %w[ id 
                               created_at 
                               updated_at
                             ]
    !nonuseful_column_names.include?(column_name) 
  end
end