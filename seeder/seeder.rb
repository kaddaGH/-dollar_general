# Taxonomy
#
#
headers = {




    'Accept'=>'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
    'Accept-Encoding'=>'gzip, deflate, br',
    'Accept-Language'=>'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,de-DE;q=0.6,de;q=0.5',
    'Connection'=>'keep-alive',
    'Cookie'=>'visid_incap_960036=KGZ9BrF2QqKYUabgEJPy+yaBClwAAAAAQUIPAAAAAAD2Aqoqnah3XopLPd6kX3QU; _gcl_au=1.1.1693275214.1545243866; _ga=GA1.2.18200789.1545243868; nlbi_960036=t2wUJZ1FdCRJsKc0xR+Y4gAAAADxCb1BrfBv0b62Uew4ieIJ; mt.v=2.1078293064.1549109903129; mage-cache-storage=%7B%7D; mage-cache-storage-section-invalidation=%7B%7D; mage-translation-storage=%7B%7D; mage-translation-file-version=%7B%7D; gad_userID=R1284101307; gad_newUser=return; form_key=MDpS5d4bQ0DHcsDE; _fbp=fb.1.1549109910316.634820585; _gid=GA1.2.2096814091.1549109910; store=default; form_key=MDpS5d4bQ0DHcsDE; PHPSESSID=0ea162492a8b393146c8d7fc76099d67; __gads=ID=6b56891489bf8672:T=1549109912:S=ALNI_MbXf77nTg0d1H7uR0O4NqLkPTm9Wg; mage-cache-sessid=true; private_content_version=5d81b2a1cdfc0f686e1c28238caa9997; incap_ses_533_960036=CT05An5nCn3JeUs7n5llB4nOVVwAAAAArKEzy/r++du40IrsV200Uw==; incap_ses_727_960036=pF4zL3RWDBUA5uzSgNMWCn0nVlwAAAAAx7Nr8AmU+6STh25dcy5MJg==; gad_sessionID=R2017031943; __pr.NaN=s1mct20dnc; __pr.1otp=rzv4mjhj35; section_data_ids=%7B%22cart%22%3A1549151744%2C%22directory-data%22%3A1549151745%2C%22customer%22%3A1549151744%2C%22compare-products%22%3A1549151744%2C%22review%22%3A1549151744%2C%22last-ordered-items%22%3A1549151744%2C%22wishlist%22%3A1549151744%2C%22dgfavoritestore%22%3A1549151744%2C%22paypal-billing-agreement%22%3A1549151744%7D; incap_ses_472_960036=os3pCbnm2VFANCUUQeKMBikzVlwAAAAAD8+vVHpHLdJ5QFhaK4kBMg==; _gat_UA-7961330-1=1; gad_pageNumber=3; _br_uid_2=uid%3D3980914918963%3Av%3D12.0%3Ats%3D1545243868766%3Ahc%3D13; mage-messages=; _derived_epik=dj0yJnU9NUQwR3JoMVl1eDR6TnpCU1dybkozY09VcWZxUkk4a1Ambj1xMWxFVEo5YV9FUlE4b3Z0Z0xCYzRRJm09MSZ0PUFBQUFBRnhXTTBJ',
    'Host'=>'www.dollargeneral.com',
    'Referer'=>'https://www.dollargeneral.com/catalogsearch/result/?q=Red+Bull',
    'Upgrade-Insecure-Requests'=>'1',
    'User-Agent'=>'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36'
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
