require_relative 'note'
class Archive
  attr_reader :lib
  def initialize
    @lib = []
  end

  def add_note(title)
    @lib.push(Note.new(title))
  end

  def show_menu
    "1. Add a note\n2. Edit a note\n3. View a note\n4. End session"
  end
end
