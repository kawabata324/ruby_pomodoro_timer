
age = 8
result = case age
     when 0..2
        :baby
    when 3..6
        :littleChild
    when 7..12
        :child
    when 13..18
        :youth
    else
         :adult
end

puts result

