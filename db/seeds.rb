# $ rake db:reset db:migrate
# Loads framing.csv into the db

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'framings.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Framing.new
  Framing.column_names.each do |column_name|
      t[column_name] = row[column_name] 
  end
  t.save 
end

def is_company_name name
  exceptions = %w[id desc created_at updated_at]
  !(exceptions.include? name)
end

def valid_value value
  value != '-'
end

Framing.all.each do |framing|
  framing.attributes.each do |key, value|
    if is_company_name key and valid_value value
      str = "#{key}_#{value.to_s.downcase}.jpg"
      image = Image.new(url: str, framing_id: framing.id)
      image.save 
    end
  end
end 

csv_text = File.read(Rails.root.join('lib', 'seeds', 'page_numbers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  url = "coserv_#{row["framing"]}.jpg"
  image = Image.find_by url: url
  image.href = "#page=#{row[1]}"
  image.save
end

images = Image.all
images.each { |image| puts image.attributes }