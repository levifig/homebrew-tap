class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.8/loaf_2.0.0-alpha.8_darwin-arm64.tar.gz"
      sha256 "e2917679002ca3562fb81d3b2b130c20897b1e0d2bf7bb01bd0abf313a73550b"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.8/loaf_2.0.0-alpha.8_darwin-x64.tar.gz"
      sha256 "f58012972206b9f21e766c22911b1ff4efbb92083ab6bf9d0f5b8bfa2db48e94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.8/loaf_2.0.0-alpha.8_linux-arm64.tar.gz"
      sha256 "a185a0030a067f31294ab5b9d45a896d781df66e511cf728c499ec561d001585"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.8/loaf_2.0.0-alpha.8_linux-x64.tar.gz"
      sha256 "eec63a36beb946fb09f0303c77ecba42623f15e9024ff667247751c1953ad82e"
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
