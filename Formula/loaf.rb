class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.13/loaf_2.0.0-alpha.13_darwin-arm64.tar.gz"
      sha256 "c57ac00d371527312503a0fc0e2275aa28c112e98409605b8c7f743d6581039f"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.13/loaf_2.0.0-alpha.13_darwin-x64.tar.gz"
      sha256 "a505d3aa78c3340d3ec6b565f8439e7cc7e135b6ac58c6cbce61ec8048f808a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.13/loaf_2.0.0-alpha.13_linux-arm64.tar.gz"
      sha256 "98ff5442a99116aad734b22592cf635e21d36adeb05263823ce581fe86f468dd"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.13/loaf_2.0.0-alpha.13_linux-x64.tar.gz"
      sha256 "022d356ffec5a7d3de0e8132107aa5dcb32edc1ea0904cf25771227e4029875e"
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
