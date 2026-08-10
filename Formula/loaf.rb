class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.2.21/loaf_0.2.21_darwin-arm64.tar.gz"
      sha256 "20cdba7cea9af0bd546b7eacacbf21a875b579bb01949f260517408b47422fd9"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.2.21/loaf_0.2.21_darwin-x64.tar.gz"
      sha256 "8692eb9e0837cbf610ecfca7c63dc56ba2762c702ad2a41b3fe54b698e6d990b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.2.21/loaf_0.2.21_linux-arm64.tar.gz"
      sha256 "fd599d39577e476fc555ffaedc37762a2f8246e892b23eef1b2c5e1c60471620"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.2.21/loaf_0.2.21_linux-x64.tar.gz"
      sha256 "ca4e3e2d729394f61662866606470cba7a60a6e067eeb1b610230e3472b75692"
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
