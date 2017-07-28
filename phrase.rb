def phrase(password)
  ary = [1234, 7654, 1324]
  code = ary[0]
  if password == code
  redirect '/calc?password=' + password
else
  redirect '/wrong_pass?password=' + password
  end
end
