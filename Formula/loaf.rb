class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.14/loaf_2.0.0-alpha.14_darwin-arm64.tar.gz"
      sha256 "3bed1429743b42dbe9d2327f40b4283643923826d0693a87cc0290818774271a"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.14/loaf_2.0.0-alpha.14_darwin-x64.tar.gz"
      sha256 "c537c9ad6176fdb2299182a143fec81f50acc8ce9ae498ecedf8ad9ce5414caa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.14/loaf_2.0.0-alpha.14_linux-arm64.tar.gz"
      sha256 "f1c747500f2aa45b65b8b4db03aea5a21a12004e8f7b2313bcec2f19797103d7"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.14/loaf_2.0.0-alpha.14_linux-x64.tar.gz"
      sha256 "d39b7f9fa09a203e7da446760d14ab901abc2991c99541dc42edad86ce8db6a0"
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
