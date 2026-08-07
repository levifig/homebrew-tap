class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_darwin-arm64.tar.gz"
      sha256 "0ae119f2f317fe84117f17a23c5415198fa34f9ed9799ddf91d0c1d8497ad8e7"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_darwin-x64.tar.gz"
      sha256 "1b31c508a4c16480ee125f9e9f885b9c432757c846ed81bc76689abb2c74f395"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_linux-arm64.tar.gz"
      sha256 "ef06c75228237bfe1469a45b265253f9b8a8e5f1ed8fab08c0e9ab1a6ca4164a"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.2.20/loaf_0.2.20_linux-x64.tar.gz"
      sha256 "5ff10ec8fa1c5b09ddd3d2c70eba08d42858703d4dcafe2de5d062ba59f7a7ed"
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
