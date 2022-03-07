class BookingPage < Main
  def provide_first_name(f_name)
    first_name.set(f_name)
  end

  def provide_last_name(l_name)
    last_name.set(l_name)
  end

  def provide_email(mail)
    email.set(mail)
  end

  def provide_country(country_code)
    country.select(country_code)
  end

  def provide_phone(tel)
    phone.set(tel)
  end

  def provide_special_requests(requests)
    special_requests.send_keys(requests)
  end

  def click_on_reserve_button
    reserve_button.click
  end

  def reservation_details_section
    @browser.div(text: 'Reservation details')
  end

  def reservation_date_time
    @browser.section(id: 'search').div(class: 'mb-1', index: 0)
  end

  def number_of_guests
    @browser.section(id: 'search').div(class: 'mb-1', index: 1)
  end

  private

  def first_name
    @browser.text_field(id: 'web_reservation_first_name')
  end

  def last_name
    @browser.text_field(id: 'web_reservation_last_name')
  end

  def email
    @browser.text_field(id: 'web_reservation_email')
  end

  def country
    @browser.select_list(id: 'web_reservation_country_code')
  end

  def phone
    @browser.text_field(id: 'web_reservation_phone')
  end

  def special_requests
    @browser.textarea(id: 'web_reservation_notes')
  end

  def reserve_button
    @browser.button(text: 'Reserve')
  end
end
