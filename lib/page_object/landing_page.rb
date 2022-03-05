class LandingPage < Main

  #In this method is called get_guests_options method.
  #If provided number of guests is included in genereted array that option will be selected
  #If provided number of guests is included in genereted array the option 2 will be selected
  def select_number_of_guests(number)
    list_of_options = get_guests_options
    if list_of_options.include?(number)
      guests.select(number)
    else
      puts 'There is no table for provided number of guests available. The option 2 will be selected'
      guests.select('2')
    end
  end

  def select_the_date(provided_date)
    date.select(provided_date)
  end

  #Check if validaton message `We do not have any slots available for given criteria, please look below to view the next available date` exist
  #If message exist script open section below
  #In this method is also called get_available_timeslots method. From the generated array first available timeslot is selected.
  def select_time
    if validation_message.exist?
      open_next_available_date_section
    end
    list_of_available_timeslots = get_available_timeslots
    timeslot(list_of_available_timeslots[0]).fire_event :click
  end

  def click_on_continue_button
    continue_button.click
  end

  def validation_message
    @browser.p(class: 'text-sm')
  end

  def open_next_available_date_section
    next_available_date_section.fire_event :click
  end

  private

  def guests
    @browser.select_list(name: 'covers')
  end

  def date
    @browser.select_list(name: 'date')
  end

  def timeslots
    @browser.div(class: 'timeslots')
  end

  def timeslot(time)
    @browser.element(xpath: "//div[contains(@class, 'timeslots')]/div[label[text() = '#{time}']]/input")
  end

  #This method get the list of available options that can be select as a number of guests
  def get_guests_options
    option_array = Array.new
    options = guests.options
    options.each do |option|
      option_array.push option.value
    end

    option_array
  end

  #This method get the list of available timeslots that are enabled that can be select as a time
  def get_available_timeslots
    available_timeslots = Array.new
    all_timeslots = timeslots.labels.to_a
    all_timeslots.each do |time|
      if timeslot(time.text).enabled?
        available_timeslots.push time.text
      end
    end

    available_timeslots
  end

  def continue_button
    @browser.button(text: 'Continue')
  end

  def next_available_date_section
    @browser.h3(class: 'cursor-pointer')
  end
end
