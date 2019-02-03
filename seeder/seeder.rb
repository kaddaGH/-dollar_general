require './lib/headers'
# Taxonomy
#

phantomjscloud_api_key = 'ak-4grtj-aha4b-1vh2t-be9b8-psnv0'
phantomjscloud_api_url = 'http://PhantomJScloud.com/api/browser/v2/'+phantomjscloud_api_key+'/'
headers = {'content-type'=>'application/json'}

request_body={
    "url"=>"https://www.dollargeneral.com/food/beverages/energy-drinks.html",
    "renderType"=>"html"
}

 pages << {
   page_type: 'listing',
   method:'POST',
   url: phantomjscloud_api_url,
   headers:headers,
   body:request_body.to_json,
   vars: {
     input_type: 'taxonomy',
     search_term: '-',
     page: 1
   }
 }

['Red bull', 'RedBull', 'Energy Drink', 'Energy Drinks'].each do |search_term|

  request_body={
      "url"=>"https://www.dollargeneral.com/catalogsearch/result/?q=#{search_term}",
      "renderType"=>"html"
  }
  pages << {
      page_type: 'products_listing',
      method:'POST',
      url: phantomjscloud_api_url,
      headers:headers,
      body:request_body.to_json,
      vars: {
          input_type: 'Search',
          search_term: search_term,
          page: 1
      }
  }
end
