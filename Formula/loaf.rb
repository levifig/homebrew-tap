class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_darwin-arm64.tar.gz"
      sha256 "beeb3abdddc70cf5b89f5f1bb7a18f5e6f22872f73fe9acc818d5b06aaf35e7f"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_darwin-x64.tar.gz"
      sha256 "698f0789c59c55936c3aa807f0e4e6f05149cff8079890660bebcb86da2fbeb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_linux-arm64.tar.gz"
      sha256 "bf2c0ba07ca4b6aff7e8af653857c366791deec1e17345c8f0b51dc78a51239f"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_linux-x64.tar.gz"
      sha256 "c949c9441681e103fa1c0a8a719efbabc376e8731e95133bd79899a3d270fe4a"
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
