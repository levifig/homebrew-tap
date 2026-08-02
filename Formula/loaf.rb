class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.19/loaf_2.0.0-alpha.19_darwin-arm64.tar.gz"
      sha256 "7e47f0f2cd99a015b0593303607c5fd402aef07033fb199b428c71e22ca620be"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.19/loaf_2.0.0-alpha.19_darwin-x64.tar.gz"
      sha256 "6d5e1daa9272c6ad39f24f6311d6b582bc1924a8e4da77602c9d766545e0b288"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.19/loaf_2.0.0-alpha.19_linux-arm64.tar.gz"
      sha256 "0185c649b7b03198198d1858e150217a35f387e48f814a30296ae852f4b761fa"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.19/loaf_2.0.0-alpha.19_linux-x64.tar.gz"
      sha256 "8cdc120eea94ba38bf41e045d57b8c8daff55575047bd8eaf8e2a6ffe58f87dc"
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
