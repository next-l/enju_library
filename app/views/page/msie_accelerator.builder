xml.openServiceDescription("xmlns" => "http://www.microsoft.com/schemas/openservicedescription/1.0") do
  xml.homepageUrl LibraryGroup.site_config.url
  xml.display do
    xml.name LibraryGroup.system_name(@locale)
    xml.description t('page.search_catalog_at', library_name: LibraryGroup.system_name(@locale))
  end
  xml.activity("category" => t('page.search')) do
    xml.activityAction do
      xml.preview("action" => manifestations_url)
      xml.execute("action" => manifestations_url) do
        xml.parameter("name" => "query", "value" => "{selection}")
      end
    end
  end
end
