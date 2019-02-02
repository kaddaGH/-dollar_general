# Taxonomy
#
#
headers = {

    'Host' => 'www.dollargeneral.com',
    'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept - Language ' => 'fr, fr - FR; q = 0.8, en - US; q = 0.5, en; q = 0.3 ',
    'Accept-Encoding' => 'gzip, deflate, br',
    'DNT ' => ' 1 ',
    'Connection' => 'keep-alive',
   'Upgrade-Insecure-Requests' => '1'
}
pages << {
    page_type: 'products_listing',
    url: 'https://www.dollargeneral.com/food/beverages/energy-drinks.html',
    fetch_type: 'fullbrowser',
    headers:headers,
    vars: {
        input_type: 'taxonomy',
        search_term: '-',
        page: 1
    }
}

['Red bull', 'RedBull', 'Energy Drink', 'Energy Drinks'].each do |search_term|
  pages << {
      page_type: 'products_listing',
      url: "https://www.dollargeneral.com/catalogsearch/result/?q=#{search_term.gsub(' ', '+')}",
      fetch_type: 'fullbrowser',
      headers:headers,
      vars: {
          input_type: 'Search',
          search_term: search_term,
          page: 1
      }
  }
end
