require './lib/headers'
require 'uri'
body = Nokogiri.HTML(content)

render_api_url = 'https://api.prerender.com/render?token=v5FvYt7VfAo0W4dIO0ly&url='
products = body.search('li.product-item a.product') rescue []


scrape_url_nbr_products = body.at('p.toolbar-amount').at('span.toolbar-number').children.text.to_i rescue 0
current_page = page['vars']['page']


if current_page == 1
  scrape_url_nbr_prod_pg1 = products.length
else
  scrape_url_nbr_prod_pg1 = page['vars']['SCRAPE_URL_NBR_PROD_PG1']
end

next_page = body.at_css(".pages-item-next a")


products.each_with_index do |product, i|

  pages << {
      page_type: 'product_details',
      method: 'GET',
      url: render_api_url+product.attr("href")+ "?suid=#{page['vars']['search_term']}#{i + 1}#{current_page}",
      vars: {
          'input_type' => page['vars']['input_type'],
          'search_term' => page['vars']['search_term'],
          'SCRAPE_URL_NBR_PRODUCTS' => scrape_url_nbr_products,
          'SCRAPE_URL_NBR_PROD_PG1' => scrape_url_nbr_prod_pg1,
          'rank' => i + 1,
          'page' => page['vars']['page']
      }

  }

end


if not next_page.nil?


  pages << {
      page_type: 'products_listing',
      method: 'GET',
      url: render_api_url+URI::encode(next_page.attr('href')),
      vars: {
          'input_type' => page['vars']['input_type'],
          'search_term' => page['vars']['search_term'],
          'SCRAPE_URL_NBR_PROD_PG1' => scrape_url_nbr_prod_pg1,
          'page' => current_page + 1
      }

  }


end