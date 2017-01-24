require 'open3'

module RunCommandHelpers

  def run_command(cli)
    begin
      stdin, stdout, stderr, thread = Open3.popen3(cli)
      console = stdout.readlines.join ""
      if block_given?
        yield console
      end
    ensure
      thread.kill
      stdin.close
      stdout.close
      stderr.close
    end
  end
end
