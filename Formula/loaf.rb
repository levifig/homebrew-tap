class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.15/loaf_2.0.0-alpha.15_darwin-arm64.tar.gz"
      sha256 "aa0cd6a136235154bee284a60b500b7ab6d9465f651e772a203d5c0477c755e6"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.15/loaf_2.0.0-alpha.15_darwin-x64.tar.gz"
      sha256 "5a570a0e2703a248237e209654f8d2f62d733127b709dbcc2d752f545dc582a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.15/loaf_2.0.0-alpha.15_linux-arm64.tar.gz"
      sha256 "9ed09f760c829eb5f1ff40304c920c0ddac755fe5832a72a1a58a4870301f325"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.15/loaf_2.0.0-alpha.15_linux-x64.tar.gz"
      sha256 "298a9daf4f438bc33199d58944210ccbad70f81340acdfed73466ea05435cf0c"
    end
  end

  def install
    libexec.install "bin", "package.json", "config", "content", "dist", "plugins"
    bin.write_exec_script libexec/"bin/loaf"
  end

  test do
    output = shell_output("#{bin}/loaf --version")
    assert_match "loaf", output
    assert_match version.to_s, output
  end
end
