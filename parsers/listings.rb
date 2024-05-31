nokogiri = Nokogiri.HTML(content)

products = nokogiri.css('.s-result-item.s-asin')
# products = nokogiri.at_css('._octopus-search-result-card_style_apbSearchResultItem__2-mx4')

products.each do |product|
  a_element = product.at_css('[data-cy="title-recipe"] a.a-link-normal.a-text-normal')
  # puts 1
  if a_element
    url = a_element['href'].gsub(/&qid=[0-9]*/,'')
    full_url = URI.join('https://www.amazon.com', url).to_s
    pages << {
        url: full_url,
        page_type: 'products',
        vars: {
          category: page['vars']['category'],
          url: full_url
        }
      } 
  end
end

# File.open("jobs11.json","w") do |f|
#   f.write(JSON.pretty_generate(nokogiri))
# end


# total_page_summary = nokogiri.css("li.comet-pagination-item.comet-pagination-item-60 > a").text
# total_page = total_page_summary.scan(/\d+/).first.to_i
2.upto(10) do |i|
    if i < 11
        # pageUrl = "https://www.amazon.com/s?k=oled+tv%27s&i=electronics&rh=n%3A1266092011&page=#{i}&qid=1716828365&ref=sr_pg_#{i}"
        pageUrl = "https://www.amazon.com/s?k=lcd+%26+led+tv&i=electronics&rh=n%3A1266092011&page=#{i}&qid=1717150697&ref=sr_pg_#{i}"
        # pageUrl = "https://www.amazon.com/s/ref=sr_pg_3?rh=n%3A172282%2Cn%3A%21493964%2Cn%3A1266092011%2Cn%3A172659%2Cn%3A6459737011&page=#{i}&ie=UTF8"
        
        
        pages << {
            page_type: "listings",
            url:pageUrl,        
            vars: {
                category: page['vars']['category']
            },
        }
    end
end