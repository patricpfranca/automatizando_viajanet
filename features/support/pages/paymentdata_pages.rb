class PaymentData
  include Capybara::DSL

  def registration_passenger(data)
    find('.my-account_field input#my-account_email').set data[:email]
    person(data)
    payment(data)
    address(data)
    contact(data)
  end

  def person(data)
    within('#passengers_form') do
      find('.passengers_line--name input#nome_0').set data[:name]
      find('.passengers_line--name input#lastName_0').set data[:lastname]
      find('.passengers_line--date input#birth_0').set data[:birthdate]
      find("select[name='gender_0']").find('option', text: data[:gender]).select_option
    end
  end
  
  def payment(data)
    within('.payment_add') do
      find(".select-default select[name='flag_card']").find('option', text: data[:brand]).select_option
      find("input#number_card-0[name='number_card-0']").set data[:cardnumber]
      find(".payment_card--valcard select[name='month-0']").find('option', text: data[:validate_m]).select_option
      find(".payment_card--cardyear select[name='year-0']").find('option', text: data[:validate_y]).select_option
      find(".payment_card--nometitcard input[name='name_card']").set data[:holder]
      find(".payment_card--cpf input[name='cpf_card']").set data[:cpf]
      find(".payment_card--codcard input[name='codesecure_card-0']").set data[:cvv]
    end
  end

  def contact(data)
    within('.contact_phone') do
      find("input[name='contact_email']").set data[:email]
      find("input[name='contact_email_confirm']").set data[:email]
      find("input[name='contact_phonenumber_0']").set data[:phone]
    end
  end

  def address(data)
    within('.payment_address') do
      find(".payment_card--cep input[name='zipcode']").set data[:cep]
      sleep 3
      find(".payment_card_address_number input[name='number_address']").set data[:number]
    end
  end

  def complete
    find(:css, "input#accept-checkout[name='accept-checkout']").set(true)
    click_on 'Finalizar compra'
  end
  
  def message(msg)
    find(:css, '.in-progress', visible: true)
  end
end
