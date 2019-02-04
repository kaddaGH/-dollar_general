body = Nokogiri.HTML(content)

product = body.at_css('div.product-info-main')

if product && body.at_css('meta[property="product:price:amount"]')
  id = body.at_css('div.product-info-stock-sku div.value').text
  title = body.at_css('h1.page-title > span').text

  quantity = if body.at_css('h1.page-title > span').text =~ /(\d+)[\s-]([p]ks|[p]ack)/i
               $1
             else
               '1'
             end

  item_size = ''
  uom = ''
  if body.at_css('h1.page-title > span').text =~ /(\d+\.\d+|\d+)[\s]?(\D*oz)/i
    item_size = $1
    uom = $2
  else
    '1'
  end

  promotion_text = ''
  description = body.at_css('div.description > div.value').text
  description = description.split(/\<.*?\>/).map(&:strip).reject(&:empty?).join(' ').gsub(/\s,/,',')
  description = CGI::unescapeHTML(description)
  description = description.gsub(/[\n\s]+/,' ')
  description = description.gsub(/,/,'.')

  brand = if body.at_css('#product-attribute-specs-table td[data-th="Brand"]')
            body.at_css('#product-attribute-specs-table td[data-th="Brand"]').text
          else
            title.split(' ').first
          end

  image = body.at_css('meta[property="og:image"]')['content']
  price = body.at_css('meta[property="product:price:amount"]')['content'].to_f
  in_stock = if !body.at_css('div.product-info-stock-sku div.available').nil?
               '1'
             else
               ''
             end
  if item_size.empty? || uom.empty?
    item_size = body.at_css('#product-attribute-specs-table td[data-th="Unit Size"]').text.split(' ').first
    uom = body.at_css('#product-attribute-specs-table td[data-th="Unit Size"]').text.split(' ').last
  end

  if uom.downcase == 'each' && body.at_css('#product-attribute-specs-table td[data-th="Product Form"]')
    uom = body.at_css('#product-attribute-specs-table td[data-th="Product Form"]').text
  end

  upc_code = body.to_s.match(/upc: "(\d+)"/)[1] rescue ''

  result = {
      RETAILER_ID: '0071',
      RETAILER_NAME: 'dollar_general',
      GEOGRAPHY_NAME: 'US',
      SCRAPE_INPUT_TYPE: page['vars']['input_type'],
      SCRAPE_INPUT_SEARCH_TERM: page['vars']['search_term'],
      SCRAPE_INPUT_CATEGORY: page['vars']['input_type'] == 'taxonomy' ? 'Energy Drinks' : '-',
      SCRAPE_URL_NBR_PRODUCTS: page['vars']['SCRAPE_URL_NBR_PRODUCTS'],
      SCRAPE_URL_NBR_PROD_PG1: page['vars']['SCRAPE_URL_NBR_PRODUCTS_PG1'],
      PRODUCT_BRAND: brand,
      PRODUCT_RANK: page['vars']['rank'],
      PRODUCT_PAGE: page['vars']['page'],
      PRODUCT_ID: id,
      PRODUCT_NAME: title,
      PRODUCT_DESCRIPTION: (description == title || description[0..11] == 'Ingredients:') ? '' : description,
      PRODUCT_MAIN_IMAGE_URL: image,
      PRODUCT_ITEM_SIZE: (item_size rescue ''),
      PRODUCT_ITEM_SIZE_UOM: (uom rescue ''),
      PRODUCT_ITEM_QTY_IN_PACK: (quantity rescue ''),
      PRODUCT_STAR_RATING: '',
      PRODUCT_NBR_OF_REVIEWS: '',
      SALES_PRICE: price,
      IS_AVAILABLE: in_stock,
      PROMOTION_TEXT: promotion_text,
      EXTRACTED_ON: Time.now.to_s,
      EAN: '',
      UPC: upc_code
  }

  result['_collection'] = 'products'

  outputs << result
end
