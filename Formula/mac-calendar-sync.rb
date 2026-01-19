class MacCalendarSync < Formula
  desc "Command line tool to sync events between macOS calendars"
  homepage "https://github.com/ataias/MacCalendarSync"
  url "https://github.com/ataias/MacCalendarSync/archive/refs/tags/2026.01.19.1.tar.gz"
  sha256 "cb14c1bbc6c41112173623aad4bba46bc889c3dd8e02adec6b0917bf79aeead8"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/MacCalendarSync" => "mac-calendar-sync"

    # Generate and install shell completions
    generate_completions_from_executable(bin/"mac-calendar-sync", "--generate-completion-script")
  end

  def generate_completions_from_executable(command, *args)
    # Generate completions for bash, zsh, and fish
    bash_output = Utils.safe_popen_read(command, "--generate-completion-script", "bash")
    zsh_output = Utils.safe_popen_read(command, "--generate-completion-script", "zsh")
    fish_output = Utils.safe_popen_read(command, "--generate-completion-script", "fish")

    # Write completion scripts to temporary files and install them
    (bash_completion/"mac-calendar-sync").write bash_output
    (zsh_completion/"_mac-calendar-sync").write zsh_output
    (fish_completion/"mac-calendar-sync.fish").write fish_output
  end

  test do
    output = shell_output("#{bin}/mac-calendar-sync --help")
    assert_match "Command line tool to sync events between macOS calendars", output
  end
end
