require 'fileutils'

class Program
  @@number = 0
  @@number2 = 0
  @@number3 = (2**64) - 1  # Equivalent to UInt64.MaxValue

  def self.main(args)
    file = "File.txt"
    unless File.exist?(file)
      File.write(file, "Goodbye Cruel World!")
    end
    puts "WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!"
    gets
    Program.end
  end

  def self.end
    system('clear') || system('cls')
    file = "File.txt"
    contents = File.read(file)
    
    (@@number...@@number3).each do |i|
      @@number2 = i
      File.open(file, 'a') { |f| f.write(contents) }
      print "\r#{@@number2 + 1}"
      $stdout.flush
      file2 = "File (#{@@number2}).txt"
      FileUtils.cp(file, file2)
      file = file2
    end
    puts
  end
end

Program.main(ARGV)

