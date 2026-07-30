class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.17/loaf_2.0.0-alpha.17_darwin-arm64.tar.gz"
      sha256 "6e3781e1bdaa34e9cf49f66d91cf9b1ca2768df2c86e4f7ecfea0776ffec7ceb"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.17/loaf_2.0.0-alpha.17_darwin-x64.tar.gz"
      sha256 "9e1f42d0e361b733c5839485add73152ff654558f49793f39760d99ee527d188"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.17/loaf_2.0.0-alpha.17_linux-arm64.tar.gz"
      sha256 "e6085ef0cd141a24496f08f59b9660edab576b72ce51799a3e1414b9f5193d20"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.17/loaf_2.0.0-alpha.17_linux-x64.tar.gz"
      sha256 "366a5df4c1a622974c7e4226589f318e041620bb078d954f9140f03aa30f9076"
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
