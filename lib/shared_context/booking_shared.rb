shared_context 'Booking reservation' do |booking_data|
  let(:booking_page) { @main.goto_booking_page }

  first_name = booking_data['first_name']
  last_name = booking_data['last_name']
  email = booking_data['email']
  country = booking_data['country']
  phone = booking_data['phone']
  special_requests = booking_data['special_request']

  context 'Check Reservation details section exist' do
    it 'expects Resevation details exist' do
      booking_page.reservation_details_section.wait_until(&:present?)
    end
  end

  context 'Create reservation' do
    it 'provides first name' do
      booking_page.provide_first_name(first_name)
    end

    it 'provides last name' do
      booking_page.provide_last_name(last_name)
    end

    it 'provides email' do
      booking_page.provide_email(email)
    end

    it 'selects country' do
      booking_page.provide_country(country)
    end

    it 'provides phone' do
      booking_page.provide_phone(phone)
    end

    if special_requests
      it 'provides special request' do
        booking_page.provide_special_requests(special_requests)
      end
    end
  end

  context 'Go to the Booking page' do
    it 'clicks on Continue' do
      booking_page.click_on_reserve_button
    end
  end
end
