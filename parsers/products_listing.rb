require './lib/headers'
body = Nokogiri.HTML(content)

phantomjscloud_api_key = 'ak-4grtj-aha4b-1vh2t-be9b8-psnv0'
phantomjscloud_api_url = 'http://PhantomJScloud.com/api/browser/v2/'+phantomjscloud_api_key+'/'
headers = {'content-type'=>'application/json'}



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
  request_body={
      "url"=> product.attr("href")+ "?search=#{page['vars']['search_term']}+&rank=#{i + 1}",
      "renderType"=>"html"
  }


  pages << {
      page_type: 'product_details',
      method: 'POST',
      url: phantomjscloud_api_url,
      headers:headers,
      body:request_body.to_json,
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

  request_body={
      "url"=> next_page.attr('href'),
      "renderType"=>"html"
  }

  pages << {
      page_type: 'products_listing',
      method: 'POST',
      url: phantomjscloud_api_url,
      headers:headers,
      body:request_body.to_json,
      vars: {
          'input_type' => page['vars']['input_type'],
          'search_term' => page['vars']['search_term'],
          'SCRAPE_URL_NBR_PROD_PG1' => scrape_url_nbr_prod_pg1,
          'page' => current_page + 1
      }

  }


end