class ConfirmationPage < Main
  def reservation_confirmed_message
    @browser.span(text: 'Reservation confirmed!')
  end

  def reservation_date_time
    @browser.section(id: 'confirmation').div.span(index: 1)
  end

  def number_of_guests
    @browser.section(id: 'confirmation').div.span(index: 2)
  end

  def eat_id
    @browser.span(class: 'text-primary')
  end
end
