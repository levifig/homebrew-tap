class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.9/loaf_2.0.0-alpha.9_darwin-arm64.tar.gz"
      sha256 "c9305dcd3a408c0591f372d3066899ae58a809166153ba08330f9f53f1f1eda4"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.9/loaf_2.0.0-alpha.9_darwin-x64.tar.gz"
      sha256 "ed3d5fd1bb27fc915f34307ca655a499dfac9928052eba182a50428843d6f92e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.9/loaf_2.0.0-alpha.9_linux-arm64.tar.gz"
      sha256 "540bfc0b2d49fb2ef3d19cbb0ad665b89ab9de640201ae1865ce1876e9a5c480"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.9/loaf_2.0.0-alpha.9_linux-x64.tar.gz"
      sha256 "68fb6522638154286f6a60ab16a1f352d55d0acede94ab4310d2d2e718f3f79a"
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
