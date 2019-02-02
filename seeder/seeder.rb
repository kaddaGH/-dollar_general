# Taxonomy
#
#
headers = {

    'Host' => 'www.dollargeneral.com',
    'User - Agent ' => 'Mozilla / 5.0 (Macintosh; Intel Mac OS X 10.10; rv : 65.0) Gecko / 20100101 Firefox / 65.0 ',
    'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept - Language ' => 'fr, fr - FR; q = 0.8, en - US; q = 0.5, en; q = 0.3 ',
    'Accept-Encoding' => 'gzip, deflate, br',
    'DNT ' => ' 1 ',
    'Connection' => 'keep-alive',
    'Cookie ' => 'visid_incap_960036 = r1GePdU2Sm6IZcHMStWAui3BVVwAAAAAQUIPAAAAAAA7MCYgMgeHSDyc4hVtRwCB; nlbi_960036 = i + m4Q7Elpl1f6eRWxR + Y4gAAAABWo5XnEGoYYo + pmoK9DZhJ; incap_ses_533_960036 = ny2GeLaPtXhizjo7n5llBy7BVVwAAAAA848ianxSpZ86O054DZp / dg ==; mt.v = 2.1953521520 .1549123888703; _fbp = fb .1 .1549123897063 .976672937; mage - cache - storage = % 7 B % 7 D; mage - cache - storage - section - invalidation = % 7 B % 7 D; mage - translation - storage = % 7 B % 7 D; mage - translation - file - version = % 7 B % 7 D; _gcl_au = 1.1 .227350307 .1549123899; gad_sessionID = R1498876801; gad_userID = R30102496; gad_pageNumber = 1; gad_newUser = return; __gads = ID = b32db6fac7ae09cf : T = 1549123899 : S = ALNI_Ma2 - OFxRcKRSmv30_IRTtKcJq9LwQ; _br_uid_2 = uid % 3 D8620000617098 % 3 Av % 3 D12 .0 % 3 Ats % 3 D1549123902525 % 3 Ahc % 3 D1; _ga = GA1 .2 .1536855465 .1549123899; _gid = GA1 .2 .1173212027 .1549123903; form_key = ssq498IvOCUtdncA; mage - messages =; store = default; PHPSESSID = d0e3b8992d7e3ae989888fe8dc6b735d; form_key = ssq498IvOCUtdncA; section_data_ids = % 7 B % 22 cart % 22 % 3 A1549123917 % 7 D',
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
