# Bob the lackadaisical teenager
#  on question, answer 'Sure.'
#  on yell, answer 'Whoa, chill out!'
#  on empty text, answer 'Fine. Be that way!'
#  on anything else, answer 'Whatever.'
class Bob
  QUESTION_ANSWER = 'Sure.'.freeze
  YELL_ANSWER = 'Whoa, chill out!'.freeze
  DEFAULT_ANSWER = 'Whatever.'.freeze

  def hey(message)
    return YELL_ANSWER if message.upcase == message
    return QUESTION_ANSWER if message[-1] == '?'
    DEFAULT_ANSWER
  end
end
