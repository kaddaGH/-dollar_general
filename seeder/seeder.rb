render_api_url = 'https://api.prerender.com/render?token=v5FvYt7VfAo0W4dIO0ly&url='
pages << {
    page_type: 'products_listing',
    method:'GET',
    force_fetch: true,
    url: render_api_url+"https://www.dollargeneral.com/food/beverages/energy-drinks.html",

    vars: {
        input_type: 'taxonomy',
        search_term: '-',
        page: 1
    }
}

['Red bull', 'RedBull', 'Energy Drink', 'Energy Drinks'].each do |search_term|
  pages << {
      page_type: 'products_listing',
      method:'GET',
      force_fetch: true,
      url: render_api_url+"https://www.dollargeneral.com/catalogsearch/result/?q=#{search_term}",
      vars: {
          input_type: 'Search',
          search_term: search_term,
          page: 1
      }
  }
end