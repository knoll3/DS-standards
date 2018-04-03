# $ rake db:reset db:migrate
# Loads framing.csv into the db

require 'csv'

def is_company_name name
  exceptions = %w[id desc created_at updated_at]
  !(exceptions.include? name)
end

def valid_value value
  value != '-'
end

def get_raw_name_from url 
  url.scan(/(.+)_/)[0][0]
end

# --------------------

# Seed framings
csv_text = File.read(Rails.root.join('lib', 'seeds', 'framings.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Framing.new
  Framing.column_names.each do |column_name|
      t[column_name] = row[column_name] 
  end
  t.save 
end

# Seed images
Framing.all.each do |framing|
  framing.attributes.each do |key, value|
    if is_company_name key and valid_value value
      str = "#{key}_#{value.to_s.downcase}.jpg"
      image = Image.new(url: str, framing_id: framing.id)
      image.save 
    end
  end
end 

# Seed page, company, and section
csv_text = File.read(Rails.root.join('lib', 'seeds', 'page_numbers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image = Image.find_by(url: row["url"])
  image.page       = row["page"]
  image.section    = row["section"]
  image.company    = row["company"]
  image.save
end

# Seed companies
Company.create(name: 'coserv', visible: true)
Company.create(name: 'oncor', visible: true)
Company.create(name: 'tnmp', visible: true)
Company.create(name: 'trinity_valley', visible: true)

# Seed companies into images
images = Image.all
images.each do |image|
  image.company = image.url.scan(/(.+)_/)[0][0]
  image.save
end


