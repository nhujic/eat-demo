shared_context 'Booking reservation' do |booking_data, confirmation_data, selected_time|
  let(:booking_page) { @main.goto_booking_page }

  first_name = booking_data['first_name']
  last_name = booking_data['last_name']
  email = booking_data['email']
  country = booking_data['country']
  phone = booking_data['phone']
  special_requests = booking_data['special_request']

  guests = confirmation_data['guests']
  today_date = Time.now.strftime('%A, %B %-d')
  tomorrow = Time.now + (60 * 60 * 24)
  tomorrow_date = tomorrow.strftime('%A, %B %-d')

  context 'Check Reservation details section exist' do
    it 'expects Resevation details exist' do
      booking_page.reservation_details_section.wait_until(&:present?)
    end

    #Based on selected date (if validation message exist) check that Date is available in details (today or tomorrow date)
    it "checks that reservation date is #{today_date} or #{tomorrow_date}" do
      expect(booking_page.reservation_date_time.text).to include(today_date) .or include(tomorrow_date)
    end

    it 'checks that reservation time is equal to selected time' do
      time = selected_time.time.swapcase.gsub(/\s+/, '')
      expect(booking_page.reservation_date_time.text).to include(time)
    end

    #If provided number of guests is not available to be selected the 2 as an option will be selected
    it "checks that reservation number of guest is equal to #{guests} or 2" do
      expect(booking_page.number_of_guests.text).to include("#{guests} guests") .or include('2 guests')
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

    #special request is not mandatory field
    if special_requests
      it 'provides special request' do
        booking_page.provide_special_requests(special_requests)
      end
    end
  end

  context 'Go to the Confirmation page' do
    it 'clicks on Reserve' do
      booking_page.click_on_reserve_button
    end
  end

  include_context 'Booking confirmation', confirmation_data, selected_time
end
