class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  version "2.0.0-pre.20260614235428"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-arm64.tar.gz"
      sha256 "a98304e6f8452d04e3bb011c03fdc25b6c5e136d81405793212cfa1806bd8012"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-x64.tar.gz"
      sha256 "2b4b3d89bf19537e4b98b41005af94a7342ef5d9c72fb9c5ccb05dfe135cd2a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-arm64.tar.gz"
      sha256 "9bb07bb8f6939815c05c62f6645be29532b1ffdea7808ecc4a6ee1d849d5cb8a"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-x64.tar.gz"
      sha256 "b96d44c7e8cd933e0373fe57345f72803914727ed23efe4bd744f602234824b5"
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
