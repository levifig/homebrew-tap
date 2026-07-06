class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.5/loaf_2.0.0-alpha.5_darwin-arm64.tar.gz"
      sha256 "8bbd9e2162157f359d60e85a5e3a2d7ab767fa7b5ef8da8a6c27ed6ad5d3146d"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.5/loaf_2.0.0-alpha.5_darwin-x64.tar.gz"
      sha256 "6d21fbf9084f8fc1be7dc7e379442b27b8123381bbff78f0a06b4f06267863a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.5/loaf_2.0.0-alpha.5_linux-arm64.tar.gz"
      sha256 "1bd2c787dc8cc1a2dd1434e86c2c2f7faa55aacad168722efa42fee79a2a50dd"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.5/loaf_2.0.0-alpha.5_linux-x64.tar.gz"
      sha256 "5f29a6608ed727721d80cb93255f6163faf61132b237f84834a0058778ec7fd4"
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
