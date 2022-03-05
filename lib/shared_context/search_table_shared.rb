shared_context 'Search table' do |data|
  let(:landing_page) { @main.goto_landing_page }

  guests = data['guests']
  date = data['date']

  context 'Search table for provided guests and date' do
    it 'selects number of guests' do
      landing_page.select_number_of_guests(guests)
    end

    it 'selects the date' do
      landing_page.select_the_date(date)
      sleep 2
    end
  end

  context 'Select time' do
    it 'selects first available time' do
      if landing_page.validation_message.exist?
        landing_page.open_next_available_date_section
      end
      landing_page.select_time
    end
  end

  context 'Go to the Booking page' do
    it 'clicks on Continue' do
      landing_page.click_on_continue_button
    end
  end
end
