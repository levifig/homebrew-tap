class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.18/loaf_2.0.0-alpha.18_darwin-arm64.tar.gz"
      sha256 "ecb5b0d6bc7630105f807507074eb3bad32951aa01051204254f9f48407c8d08"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.18/loaf_2.0.0-alpha.18_darwin-x64.tar.gz"
      sha256 "399e608f2aa957def9ce4ca79f37f3ec12a9069d819ed36ce2a0c13ce61088ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.18/loaf_2.0.0-alpha.18_linux-arm64.tar.gz"
      sha256 "79a9c1a3d550568e8de70a262589bade16130eb797e4fa6bf1cf79ede81e3181"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.18/loaf_2.0.0-alpha.18_linux-x64.tar.gz"
      sha256 "7b618c37d8b2393edd706e3d506ef7774ba0b9fe05e87fd733e81318cd2720c6"
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
