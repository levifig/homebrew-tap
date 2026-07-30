class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_darwin-arm64.tar.gz"
      sha256 "3f3b1d273899edb6c6f93774f9d0598a8a0555e4ed2ed03136ba09ec2a818242"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_darwin-x64.tar.gz"
      sha256 "76493024a8878803e6d80c51d8921fe887197db767ba6d4de95fe9f2b579f20f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_linux-arm64.tar.gz"
      sha256 "c76713828aab517152d0e08d4bdf7f7180bde9561cadc69f196af9d2ffa315af"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.16/loaf_2.0.0-alpha.16_linux-x64.tar.gz"
      sha256 "af6e642645ba8ab7deaba738624bdd1810c60aa409e68b40e51ab6a7445ce67d"
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
