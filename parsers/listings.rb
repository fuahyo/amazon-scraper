nokogiri = Nokogiri.HTML(content)
products = nokogiri.css('.s-latency-cf-section .s-result-item .sg-col-inner')
# products = nokogiri.css('#mainResults li', '#resultsCol li')
products.each do |product|
  a_element = product.at_css('[data-cy="title-recipe"] a.a-link-normal.a-text-normal')
  if a_element
    url = a_element['href'].gsub(/&qid=[0-9]*/,'')
    if url =~ /\Ahttps?:\/\//i
      pages << {
          url: url,
          page_type: 'products',
          vars: {
            category: page['vars']['category'],
            url: url
          }
        }
    end
  end
end

# total_page_summary = nokogiri.css("li.comet-pagination-item.comet-pagination-item-60 > a").text
# total_page = total_page_summary.scan(/\d+/).first.to_i
2.upto(9) do |i|
    if i < 11
        pageUrl = "https://www.amazon.com/s?k=oled+tv%27s&i=electronics&rh=n%3A1266092011&page=#{i}&qid=1716828365&ref=sr_pg_#{i}"
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
# pagination_links = nokogiri.css('#pagn a')
# pagination_links.each do |link|
#   page_num = link.text.strip
#   if page_num =~ /[0-9]/
#     url = "https://www.amazon.com/s/ref=sr_pg_3?rh=n%3A172282%2Cn%3A%21493964%2Cn%3A1266092011%2Cn%3A172659%2Cn%3A6459737011&page=#{page_num}&ie=UTF8"
#     pages << {
#         url: url,
#         page_type: 'listings',
#         vars: {
#           category: page['vars']['category']
#         }
#       }
#   end
# end
#search > div.s-desktop-width-max.s-desktop-content.s-opposite-dir.s-wide-grid-style.sg-row > div.sg-col-20-of-24.s-matching-dir.sg-col-16-of-20.sg-col.sg-col-8-of-12.sg-col-12-of-16 > div > span.rush-component.s-latency-cf-section > div.s-main-slot.s-result-list.s-search-results.sg-row > div:nth-child(6) > div > div > div > div > span > div > div > div > div.puisg-col.puisg-col-4-of-12.puisg-col-8-of-16.puisg-col-12-of-20.puisg-col-12-of-24.puis-list-col-right > div > div > div.a-section.a-spacing-none.puis-padding-right-small.s-title-instructions-style > h2 > a > span
#search > div.s-desktop-width-max.s-desktop-content.s-opposite-dir.s-wide-grid-style.sg-row > div.sg-col-20-of-24.s-matching-dir.sg-col-16-of-20.sg-col.sg-col-8-of-12.sg-col-12-of-16 > div > span.rush-component.s-latency-cf-section