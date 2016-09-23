def anagram1(str1, str2)
  str1_anagrams = str1.split("").permutation.map { |word| word.join }
  str1_anagrams.each do |ana|
    return true if ana == str2
  end
  false
end

p anagram1("gizmo", "sally")
p anagram1("elvis", "lives")

def anagram2(str1, str2)
  str1.split("").each_with_index do |char1, i|
    str2.split("").each_with_index do |char2, j|
      if char1 == char2
        str1[i] = "#"
        str2[j] = "#"
        break
      end
    end
  end
  str1 == str2
end

p anagram2("gizmo", "sally")
p anagram2("elvis", "lives")

def anagram3(str1, str2)
  str1 = str1.split("").sort
  str2 = str2.split("").sort
  str1 == str2
end

p anagram3("gizmo", "sally")
p anagram3("elvis", "lives")

def anagram4(str1, str2)
  letter_count1 = Hash.new(0)
  letter_count2 = Hash.new(0)

  str1.each_char do |char1|
    letter_count1[char1] += 1
  end

  str2.each_char do |char2|
    letter_count2[char2] += 1
  end

  letter_count1.all?{|key,value| letter_count2[key]==value}
end

p anagram4("gizmo", "sally")
p anagram4("elvis", "lives")

def anagram5(str1, str2)
  letter_count = Hash.new(0)

  for i in 0...str1.length
    letter_count[str1[i]]+=1
    letter_count[str2[i]]+=1
  end

  letter_count.each do |letter,count|
    return false unless (str1.scan(letter)).length == count/2
    return false unless (str2.scan(letter)).length == count/2

  end
  return true
end

p anagram5("gizmo", "sally")
p anagram5("elvis", "lives")
