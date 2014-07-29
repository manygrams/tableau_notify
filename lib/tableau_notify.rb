require 'file-tail'
require 'json'
require 'terminal-notifier'
require 'tempfile'

module TableauNotify
  def run
    query_data = false

    File.open(File.expand_path("~/Documents/My\ Tableau\ Repository/Logs/log.txt")) do |log|
      log.extend(File::Tail)
      log.max_interval = 1
      log.interval = 0.5
      log.backward(0)

      log.tail do |line|
        logline = JSON.parse(line)
        event = logline["k"]

        query_data = true if event == "begin-data-interpreter"
        query_data = false if event == "end-data-interpreter"

        if query_data && event == "begin-query"
          query = logline["v"]["query"]

          puts "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')} - Running Query (PID #{logline['pid']}):"
          puts "#{query}"
          puts ""

          query_file = Tempfile.new(["query", ".sql"])
          query_file.write(query)
          query_file.close

          TerminalNotifier.notify(query, title: "Running Query", sender: "com.tableausoftware.tableaudesktop", group: logline["pid"], open: "file:///#{query_file.path}")
        end
      end
    end
  end
end
