def rightmost_occurrence(str, given_character)
  if /#{given_character}/i =~ str
    ((str.length - 1) - (/#{given_character}/i =~ str.reverse)).to_i
  end
end
