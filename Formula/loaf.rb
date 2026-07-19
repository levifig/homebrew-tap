class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.10/loaf_2.0.0-alpha.10_darwin-arm64.tar.gz"
      sha256 "80658d832d5e036dbfb22de98e7238a4dbd4f1fb4ef7251304699809014cdd5b"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.10/loaf_2.0.0-alpha.10_darwin-x64.tar.gz"
      sha256 "44d6741f62dcfbbcd636be6061a8494165cce3398f236b6da3fc33abe7b6b5b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.10/loaf_2.0.0-alpha.10_linux-arm64.tar.gz"
      sha256 "5405f642c6429c740325ccadb65f6ea2550aa81ee3197fc74466671ce551a4c7"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.10/loaf_2.0.0-alpha.10_linux-x64.tar.gz"
      sha256 "e547e7785f22560ea5da2b31ffa3128e2e71003f7397145c2df2b3377f530567"
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
