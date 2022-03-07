shared_context 'Booking confirmation' do |data, selected_time|
  let(:confirmation_page) { @main.goto_confirmation_page }

  guests = data['guests']
  today_date = Time.now.strftime('%A, %B %-d')
  tomorrow = Time.now + (60 * 60 * 24)
  tomorrow_date = tomorrow.strftime('%A, %B %-d')

  context 'Check Reservation confirmed message exist' do
    it 'expects Reservation confirmed message exist' do
      confirmation_page.reservation_confirmed_message.wait_until(&:present?)
    end
  end

  context 'Check reservation data' do
    #Based on selected date (if validation message exist) check that Date is available in details (today or tomorrow date)
    it "checks that reservation date is #{today_date} or #{tomorrow_date}" do
      expect(confirmation_page.reservation_date_time.text).to include(today_date) .or include(tomorrow_date)
    end

    it 'checks that reservation date is equal to selected time' do
      time = selected_time.time.swapcase.gsub(/\s+/, '')
      expect(confirmation_page.reservation_date_time.text).to include(time)
    end

    #If provided number of guests is not available to be selected the 2 as an option will be selected
    it "checks that reservation number of guest is equal to #{guests} or 2" do
      expect(confirmation_page.number_of_guests.text).to include("#{guests} guests") .or include('2 guests')
    end
  end

  context 'Check Eat ID is generated' do
    it 'expects Eat ID is generated' do
      expect(confirmation_page.eat_id).to exist
    end
  end
end
