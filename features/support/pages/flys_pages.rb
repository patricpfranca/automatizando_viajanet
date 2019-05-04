class FlysPages
  include Capybara::DSL

  def choose_fly
    within("label.btn-voo[for='0-0-0-0']") do
      find(:css, ".input input[type='radio'][value='0']").set(true)
    end

    within("label.btn-voo[for='1-0-0-0']") do
      find(:css, ".input input[type='radio'][value='0']").set(true)
    end
  end

  def purchase_button
    within(first('div.results ul.result')) do
      click_on 'Comprar'
    end
    switch_to_window windows.last
  end
end