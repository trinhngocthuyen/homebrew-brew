class ItestScanner < Formula
  desc "Test scanner for iOS projects"
  homepage "https://github.com/trinhngocthuyen/itest-scanner"
  url "https://github.com/trinhngocthuyen/itest-scanner/archive/refs/tags/0.0.1.tar.gz"
  sha256 "43390472a652768210b89e087df1b345a9b59c86f99a45b55f3319e9d893c49d"
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
