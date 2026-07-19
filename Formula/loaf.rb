class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.11/loaf_2.0.0-alpha.11_darwin-arm64.tar.gz"
      sha256 "8bd4db48521061dfef714518ff9cf9f8922a57a702d5c88def1ae5e52fedafbf"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.11/loaf_2.0.0-alpha.11_darwin-x64.tar.gz"
      sha256 "d18567fbef42e463385d523425237166100ae81a98c4ac3a6e496ee96a4620c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.11/loaf_2.0.0-alpha.11_linux-arm64.tar.gz"
      sha256 "fd2a4f3dc4318dee9fb95a65a9e86a8c7a8ae6ef6ff9f6865514b572d1a84f3b"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.11/loaf_2.0.0-alpha.11_linux-x64.tar.gz"
      sha256 "48ef228e79acdd1fe38f8b27e96ffa6229637f597ae5fd8bf5a0305893d383b1"
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
