class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  version "2.0.0-pre.20260625190923"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-arm64.tar.gz"
      sha256 "1d85f5eb8c4c014fdbd1954529cfea25bf2bff5d51ee030f8389589e94da90e1"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-x64.tar.gz"
      sha256 "4cf427ea86d3141d36159921cf3ad4befdf9968a3a2289a026cc494d68b65639"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-arm64.tar.gz"
      sha256 "c4e12d1e720db4c9a4cc7ae965d6385a54a0b91c30fae915360aa371f47f20c0"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-x64.tar.gz"
      sha256 "e957781dda79abea03ced3208e51a93c69b1f195f8d276ca0adff1fa18d33ad5"
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
