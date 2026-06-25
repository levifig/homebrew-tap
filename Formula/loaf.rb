class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  version "2.0.0-pre.20260625192947"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-arm64.tar.gz"
      sha256 "fd9d9a9988ae5875f3e504542f60e1f6349cd4cd85bb16abdf6ec072c06e49b3"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-x64.tar.gz"
      sha256 "0d246df842c9f7b269119a80ecadeb48da0c1b5ecbe2b02a008d932280360048"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-arm64.tar.gz"
      sha256 "0a121e2e04ca6763e41bd12363f201dbbaab218985900c346193d86232604cea"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-x64.tar.gz"
      sha256 "a4c28ae55b5e0736d7d3bac96f96f59eb179102f496d7db8979f4faa5bc2d3b8"
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
