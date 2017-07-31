def calculate(cal, num1, num2)
  if cal == "plus"
    sum = num1.to_i + num2.to_i
  elsif cal == "-"
    sum = num1.to_i - num2.to_i
  elsif cal == "/"
    sum = num1.to_f/num2.to_f
  elsif cal == "x"
    sum = num1.to_i * num2.to_i
  end
  sum.to_s
end
