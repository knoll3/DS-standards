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
