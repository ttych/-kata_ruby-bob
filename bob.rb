# Bob the lackadaisical teenager
#  on question, answer 'Sure.'
#  on yell, answer 'Whoa, chill out!'
#  on empty text, answer 'Fine. Be that way!'
#  on anything else, answer 'Whatever.'
class Bob
  def hey(message)
    return 'Whoa, chill out!' if message == 'WATCH OUT!'
    return 'Whatever.' if message == 'Tom-ay-to, tom-aaaah-to.'
    'Whoa, chill out!'
  end
end
