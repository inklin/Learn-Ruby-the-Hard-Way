provinces = {
  'BC' => 'British Columbia',
  'AB' => 'Alberta',
  'SK' => 'Saskatchewan',
  'NB' => 'New Brunswick',
  'NL' => 'Newfoundland and Labrador',
  'NT' => 'Northwest Territories',
  'NS' => 'Nova Scotia',
  'NU' => 'Nunavat',
  'ON' => 'Ontario',
  'MN' => 'Manitoba',
  'PE' => 'Prince Edward Island',
  'QC' => 'Quebec',
  'YT' => 'Yukon'
}

capital_cities = {
  'NL' => 'St. John\'s',
  'PE' => 'Charlottetown',
  'NS' => 'Halifax',
  'NB' => 'Fredericton',
  'QC' => 'Quebec City',
  'ON' => 'Toronto',
  'MN' => 'Winnepeg',
  'SK' => 'Regina',
  'AB' => 'Edmonton',
  'BC' => 'Victoria',
  'NU' => 'Iqaluit',
  'NT' => 'Yellowknife',
  'YT' => 'Whitehorse'
}

provinces.each do |abbrev, province|
  capital = capital_cities[abbrev]
  puts "The abbreviation for #{province} is #{abbrev} and the capital is #{capital}."
end


long_provinces = provinces.select {|k,v| v.length > 10}

puts "There are #{long_provinces.length} provinces and territory names with a length greater than 10:"
long_provinces.each do |abbrev, province_name|
  puts province_name
end

long_provinces.sort