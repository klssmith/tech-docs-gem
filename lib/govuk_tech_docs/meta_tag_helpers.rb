module GovukTechDocs
  module MetaTagHelpers
    def meta_tags
      {
        'description' => page_description,
        'og:description' => page_description,
        'og:image' => page_image,
        'og:site_name' => site_name,
        'og:title' => page_title,
        'og:type' => 'object',
        'og:url' => canonical_url,
        'twitter:card' => 'summary',
        'twitter:domain' => URI.parse(config[:tech_docs][:host]).host,
        'twitter:image' => page_image,
        'twitter:title' => browser_title,
        'twitter:url' => canonical_url,
      }
    end

    def browser_title
      "#{page_title} | #{site_name}"
    end

  private

    def page_image
      "#{config[:tech_docs][:host]}/images/govuk-large.png"
    end

    def site_name
      config[:tech_docs][:service_name]
    end

    def canonical_url
      "#{config[:tech_docs][:host]}#{current_page.url}"
    end

    def page_description
      current_page.metadata[:locals][:description] ||
        current_page.data.description ||
        yield_content(:page_description) ||
        config[:tech_docs][:description]
    end

    def page_title
      current_page.metadata[:locals][:title] ||
        current_page.data.title
    end
  end
end
