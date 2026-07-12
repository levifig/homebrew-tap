class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.6/loaf_2.0.0-alpha.6_darwin-arm64.tar.gz"
      sha256 "df208845329ccc7245360245af0d7ea4c20f7462cc65a7716e7444ec0a61bc6e"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.6/loaf_2.0.0-alpha.6_darwin-x64.tar.gz"
      sha256 "e0b4992c3a433800288a02d592ce11246417348a09d3e070c0f8a0a782ab68bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.6/loaf_2.0.0-alpha.6_linux-arm64.tar.gz"
      sha256 "f89dac72289d03ffd739d3c08566599a1cd178db68ddeac7a26c455aaa7753db"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.6/loaf_2.0.0-alpha.6_linux-x64.tar.gz"
      sha256 "8a246843303aeb3622d17ab0282bb9cc8256d8837a6826384d55d8980446eed1"
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
