class ItestScanner < Formula
  desc "Test scanner for iOS projects"
  homepage "https://github.com/trinhngocthuyen/itest-scanner"
  url "https://github.com/trinhngocthuyen/itest-scanner/archive/refs/tags/0.0.1.tar.gz"
  sha256 "7fb4c57b20593f018d7546779be48a0aa2180bf87a2a957e19425bf05e9c9542"
  license "MIT"
  head "https://github.com/trinhngocthuyen/itest-scanner.git", branch: "main"

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args, "--configuration", "release"
    bin.install ".build/release/itest-scanner"
    generate_completions_from_executable(bin/"itest-scanner", "--generate-completion-script")
  end
end
