shared_context 'Booking confirmation' do |data|
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
    it "checks that reservation date is #{today_date} or #{tomorrow_date}" do
      expect(confirmation_page.reservation_date.text).to include(today_date) or expect(confirmation_page.reservation_date.text).to include(tomorrow_date)
    end

    it "checks that reservation number of guest is equal to #{guests}" do
      expect(confirmation_page.number_of_guests.text).to include("#{guests} guests")
    end
  end

  context 'Check Eat ID is generated' do
    it 'expects Eat ID is generated' do
      expect(confirmation_page.eat_id).to exist
    end
  end
end
