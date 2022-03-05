describe 'Eat Demo Restaurant Reservation' do

  reservation_data = {
                       'search_table_data' => {
                                                'guests' => '3',
                                                'date' => Time.now.strftime('%F')
                                              },
                       'booking_data' => {
                                          'first_name' => 'Naida',
                                          'last_name' => 'Hujic',
                                          'email' => 'nhujic@gmail.com',
                                          'country' => 'BA',
                                          'phone' => '63852708',
                                          'special_request' => 'Test request'
                                         }
                     }

  include_context 'Make reservation', reservation_data['search_table_data'], reservation_data['booking_data']
end
