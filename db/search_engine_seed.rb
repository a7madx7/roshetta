module SearchEngineSeeder
  # @return [does not return anything just seeds the search engine regex]
  # @param [String] regex
  def search_seeder
    puts 'Started seeding search engine regex...'
    regex = {
      Rx: '^(#|rx|prescri.*|rosh.*|roush.*):(.*)$',
      Drug: '^(@|tm.*|drug.*|trade.*|mark.*|prod.*|dawa.*|aqar.*):(.*)$',
      Generic: '^(\$|gen.*|chemical.*|ac.*):(.*)$',
      Category: '^cat.*:(.*)$',
      Suggestion: '^(!|sug.*|tell.*|(^[gds].*for)):(.*)$',
      Question: '(^[what|who|why|is|can|will|which|when].*)\?$'
    }

    regex.each { |model, reg| SearchEngine.create!(model: model, regex: reg) }
    puts 'Done seeding search engine regex.'
  end
end
