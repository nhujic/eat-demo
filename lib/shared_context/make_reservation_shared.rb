shared_context 'Make reservation' do |data, reservation_data|
  let(:landing_page) { @main.goto_landing_page }

  guests = data['guests']
  date = data['date']

  context 'Search table for provided guests and date' do
    it 'selects number of guests' do
      landing_page.select_number_of_guests(guests)
    end

    it 'selects the date' do
      landing_page.select_the_date(date)
    end
  end

  context 'Select time' do
    it 'selects first available time' do
      landing_page.select_time
    end
  end

  context 'Go to the Booking page' do
    it 'clicks on Continue' do
      landing_page.click_on_continue_button
    end
  end

  include_context 'Booking reservation', reservation_data, data
end
