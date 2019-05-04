class SearchPages
  include Capybara::DSL

  def close_modal
    within('div#checkoutAbandon') do
      find('a.btn-close-modal').click
    end
  end

  def destination(origin, destiny)
    origin(origin)
    destiny(destiny)
  end

  def choose_date(dateStart, dateEnd)
    find('#departureDate').click
    dateStart = dateStart.gsub("/", "")
    find(".pika-table tr td .btn-#{dateStart}").click
    
    find('#arrivalDate').click
    dateEnd = dateEnd.gsub("/", "")
    find(".pika-table tr td .btn-#{dateEnd}").click
  end

  def search
    find(".lbl-hotel-submit button[type='submit']").click
  end
  
  
  private
  def origin(value)
    fieldOrigin = find('input#inptorigin')
    fieldOrigin.click
    fieldOrigin.native.clear
    fieldOrigin.set value

    within('ul#ui-autocomplete') do
      find('li', text: value).click
    end
  end

  def destiny(value)
    fieldDestiny = find('input#inptdestination')
    fieldDestiny.click
    fieldDestiny.native.clear
    fieldDestiny.set value

    within('ul#ui-autocomplete') do
      find('li', text: value).click
    end
  end
  
  
end