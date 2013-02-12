# encoding: UTF-8

module SiteHelpers

  def page_title
    title = "GORILLA software"
    title = "#{data.page.title} | #{title}" if data.page.title
    title
  end

  def page(id, &block)
    yield
  end

  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "GORILLA software. Individuelle Lösungen fürs Web."
    end
    description
  end

end
