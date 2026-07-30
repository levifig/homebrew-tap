class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_darwin-arm64.tar.gz"
      sha256 "fd598303dee576da2cae953894bf259f8f10255fbb6dc8aa0aadf4bf59f3803e"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_darwin-x64.tar.gz"
      sha256 "670bdaa6ac6be619c030878d04e339a819c8416fe0a4a6039211e99ef1091ac2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_linux-arm64.tar.gz"
      sha256 "3f57e516b65f87fa5fdbf147777e543f9a94dfaf9b2c51d3fda30fd2b202eb91"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_linux-x64.tar.gz"
      sha256 "a364167d05cc4ac77b0e91963b1250fc7e07b90bea8a4a43319a3122b4ebe544"
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
