class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.12/loaf_2.0.0-alpha.12_darwin-arm64.tar.gz"
      sha256 "63b920ab308fdeb01f378bd121d4db5ea280020c7b62976316735f90de9062f4"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.12/loaf_2.0.0-alpha.12_darwin-x64.tar.gz"
      sha256 "afb3cbd0ebb814daf337d9b301d81d8ca9e7e9b12fd936100f5d7d9072712cd0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.12/loaf_2.0.0-alpha.12_linux-arm64.tar.gz"
      sha256 "f16d7146c6b977ad167f0881bc64e90dfceebc2775475a6276803e8c843b303e"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.12/loaf_2.0.0-alpha.12_linux-x64.tar.gz"
      sha256 "ae47f12f66c1c4b75a2935fe75cd1b1dea81b0de6f3d5736c6e306f17e4352ac"
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
