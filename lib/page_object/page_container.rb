class Main
  def initialize(browser)
    @browser = browser
  end

  def goto_eatapp
    @browser.goto('https://eat-sandbox.co/reserve/eat-demo-restaurant')
  end

  def goto_landing_page
    return LandingPage.new(@browser)
  end

  def goto_booking_page
    return BookingPage.new(@browser)
  end

  def goto_confirmation_page
    return ConfirmationPage.new(@browser)
  end
end