# Taxonomy
#
#

['Red bull', 'RedBull', 'Energy Drink', 'Energy Drinks'].each do |search_term|
  pages << {
      page_type: 'products_listing',
      url: "https://www.dollargeneral.com/catalogsearch/result/?q=#{search_term.gsub(' ', '+')}",
      fetch_type: 'browser',
      vars: {
          input_type: 'Search',
          search_term: search_term,
          page: 1
      }
  }
end
