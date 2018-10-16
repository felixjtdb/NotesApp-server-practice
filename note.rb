class Note
  attr_reader :title, :body
  def initialize(title, body = "")
    @title = title
    @body = body
  end

  def write_body(text)
    @body << text
  end

  def view_note
    "#{title}\n#{body}"
  end
end
