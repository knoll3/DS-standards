require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'framings.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Framing.new
  t.desc = row['desc']
  t.coserv = row['coserv']
  t.oncor = row['oncor']
  t.tnmp = row['tnmp']
  t.trinity_valley = row['trinity_valley']
  t.save
end
puts 'db saved'