class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.3.0/loaf_0.3.0_darwin-arm64.tar.gz"
      sha256 "c0584b7f4c6621800857363bd9ced8fadd016ee85dc42eb7bf4acfe96da86aca"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.3.0/loaf_0.3.0_darwin-x64.tar.gz"
      sha256 "7c24ee61bf0687563a82ec956c8124c8595fcc43b9c5de235b2d02ca88deedc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.3.0/loaf_0.3.0_linux-arm64.tar.gz"
      sha256 "ec4f87f636ce4cc330c4047edf7d61865fb1292507c53fb2eb107caa929eff58"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.3.0/loaf_0.3.0_linux-x64.tar.gz"
      sha256 "dbdde49d5b67fc0e3d550a411be943ad9bcf2ddbcdd1b0acb275bbd7e995e04d"
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
