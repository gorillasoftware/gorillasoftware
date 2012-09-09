# encoding: UTF-8

module SiteHelpers

  def page_title
    title = "GORILLA software"
    if data.page.title
      title << " | " + data.page.title
    end
    title
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
