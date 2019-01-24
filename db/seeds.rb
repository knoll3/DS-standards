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

# Loop through for each row and then again for each company
csv.each_with_index do |row, row_number|
  desc = row[0]
  row.each do |column|
    if column[0] != "desc" and valid_value column[1]
      Framing.create(desc: desc, row: row_number, owner: column[0], standard_number: column[1])
    end
  end
end

# Seed images
Framing.all.each do |framing|

  str = "#{framing["owner"]}_#{framing["standard_number"].to_s.downcase}.jpg"
  image = Image.new(url: str, framing_id: framing.id)
  image.save 
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

company_names = Framing.all.map { |framing| framing.owner }
company_names.uniq!

company_names.each do |name|
  Company.create(name: name, visible: true)
end

# Seed companies into images
images = Image.all
images.each do |image|
  image.company = image.url.scan(/(.+)_/)[0][0]
  image.save
end


