class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  version "0.5.0"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.5.0/loaf_0.5.0_darwin-arm64.tar.gz"
      sha256 "ccab6b69b3a7f8ea504253c1d7ab204a02f3738d424102b019c01407e5687902"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.5.0/loaf_0.5.0_darwin-x64.tar.gz"
      sha256 "14ba7474011be443b5287d1a10f68e2d51c17e91c15e087a41f6eecc325ea902"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.5.0/loaf_0.5.0_linux-arm64.tar.gz"
      sha256 "f89f7d98bcf8871b19f20e1747f159f898986b6a1e62beb383333bce506abca0"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.5.0/loaf_0.5.0_linux-x64.tar.gz"
      sha256 "f7faee70059f8579cb558f45f7dee8a19a51517a9f1438cd9fbf7d7668a04429"
    end
  end

  def install
    libexec.install "bin", "package.json", "config", "content", "vnext", "dist", "plugins", ".claude-plugin"
    bin.write_exec_script libexec/"bin/loaf"
  end

  test do
    output = shell_output("#{bin}/loaf --version")
    assert_match "loaf", output
    assert_match version.to_s, output
  end
end
