render_api_url = 'https://api.prerender.com/render?token=v5FvYt7VfAo0W4dIO0ly&url='


['Energy Drink'].each do |search_term|


  pages << {
      page_type: 'products_listing',
      method:'GET',
      url: render_api_url+"https://www.dollargeneral.com/catalogsearch/result/?q=#{search_term}",
      vars: {
          input_type: 'Search',
          search_term: search_term,
          page: 1
      }
  }
end
