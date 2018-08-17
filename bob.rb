# Bob the lackadaisical teenager
#  on question, answer 'Sure.'
#  on yell, answer 'Whoa, chill out!'
#  on empty text, answer 'Fine. Be that way!'
#  on anything else, answer 'Whatever.'
class Bob
  QUESTION_ANSWER = 'Sure.'.freeze
  YELL_ANSWER = 'Whoa, chill out!'.freeze
  DEFAULT_ANSWER = 'Whatever.'.freeze

  def hey(input_message)
    message = Message.new(input_message)
    return YELL_ANSWER if message.yell?
    return QUESTION_ANSWER if message.question?
    DEFAULT_ANSWER
  end
end

# Message
# - encapsulate message behaviour
class Message
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def yell?
    text? && message.upcase == message
  end

  def question?
    message[-1] == '?'
  end

  def text?
    message.match(/[a-z]/i)
  end
end
