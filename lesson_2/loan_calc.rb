loop do
  loan_total = ' '

  puts "=> Welcome to the loan calculator!"
  loop do
    puts "=> How much is your loan in dollars?"
    print "loan amount: "
    loan_total = gets.chomp.to_f

    if loan_total <= 0
      puts "You must enter a positive number."
    else
      break
    end
  end

  puts "=> What is the Annual Percentage Rate(APR) of your loan?"
  puts "=> Input as a number. Ex: 6.2% gets input as 6.2"
  print "APR: "
  apr_annual = gets.chomp.to_f / 100

  puts "=> Last step! What is the duration of your loan in years? Months?"
  print "=> Years:"
  duration_years = gets.chomp.to_i
  print "=> Months:"
  duration_months = gets.chomp.to_i
  duration_total = (duration_years * 12) + duration_months

  # converts annual APR to monthly rate
  apr_monthly = (apr_annual / 12.0)

  # calculates monthly payment
  if apr_monthly == 0
    monthly_payment = loan_total / duration_total
  else
    monthly_payment = loan_total * (apr_monthly /
                      (1 - (1 + apr_monthly)**(-duration_total)))
  end
  monthly_payment = monthly_payment.round(2)

  # calculates monthly interest rate
  monthly_interest = ((monthly_payment * duration_total) - loan_total) /
                     duration_total
  monthly_interest = monthly_interest.round(2)

  puts "=> Calculating..."

  output = <<-MSG
  => Your loan of $#{loan_total} over #{duration_total} months will amount to a monthly payment of $#{monthly_payment}
  => Your monthly interest rate is #{monthly_interest}
  => Duration: #{duration_total}
  => Monthly interest rate: $#{monthly_interest}
  => Monthly payment: $#{monthly_payment}
  MSG
  puts output

  puts "=> Do you want to do another calculation? Y or N."
  answer = gets.chomp.upcase
  break unless answer.start_with?('Y')
end

puts "=> Thanks for using the Loan calculator! Good bye!"
