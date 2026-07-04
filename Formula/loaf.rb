class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  version "2.0.0-alpha.2"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-arm64.tar.gz"
      sha256 "61f3d3b9e537310fbeec97afa47b5653b72bcf80efa36ba001b1b4ea5580460b"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-x64.tar.gz"
      sha256 "0c0716e0f63e11633d92b4649e8e7867dc80463f6fb3f04f0ec6e7a2dd07366e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-arm64.tar.gz"
      sha256 "c6ca90eed85d40362b398f298d57efa9c6dfc064371655420ddd2a5d303e11f2"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-x64.tar.gz"
      sha256 "f9526fc73862ff29f5bb56be0a4cdf5e0f3df5a8654892c5d584e1ba76304155"
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
