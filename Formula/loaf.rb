class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.7/loaf_2.0.0-alpha.7_darwin-arm64.tar.gz"
      sha256 "be0032e6f482da647a230182f458ffc0d777fb83edd1a4944189e4e344590b0f"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.7/loaf_2.0.0-alpha.7_darwin-x64.tar.gz"
      sha256 "a8a66e9c7104aa0b8123e0532390b6c0ae9ed8dc3120aaec123d40c70dede8ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.7/loaf_2.0.0-alpha.7_linux-arm64.tar.gz"
      sha256 "d6f78a389e2b5d1f73e3613a06c40bbb87d142dcfe96fd491542e0ea1538d7f2"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.7/loaf_2.0.0-alpha.7_linux-x64.tar.gz"
      sha256 "ae16d4fd323f2d1dc46a12dfd8be5fc97ecb163b816d1f48307f2e6d72acaa6e"
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
