require 'socket'
require_relative 'archive'
archive = Archive.new


loop do
  server ||= TCPServer.new(2345)
  socket = server.accept

  loop do
    socket.puts(archive.show_menu)
    x = socket.gets.chomp
    case x
    when "1"
      socket.puts("enter title")
      archive.add_note(socket.gets.chomp)
    when "2"
      socket.puts("enter title")
      search_title = socket.gets.chomp
      archive.lib.each do |note|
        if note.title == search_title
          socket.puts("enter body")
          note.write_body(socket.gets.chomp)
        end
      end
    when "3"
      socket.puts("enter title")
      search_title = socket.gets.chomp
      archive.lib.each do |note|
        socket.puts(note.view_note) if note.title == search_title
      end
    when "4"
      socket.close
      break
    end
  end
end
