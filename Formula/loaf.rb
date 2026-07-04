class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.3/loaf_2.0.0-alpha.3_darwin-arm64.tar.gz"
      sha256 "eae627054fb4b057c9875d44cfc30b1a34d6368c8afd689cab0066d12581a4db"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.3/loaf_2.0.0-alpha.3_darwin-x64.tar.gz"
      sha256 "a9a797e66e825af811622b6cf7031733e9232a099da15c3b19a14731b28ba03a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.3/loaf_2.0.0-alpha.3_linux-arm64.tar.gz"
      sha256 "520b5cf7783d208acf5246446d1137cd3b3b3d2f1d0792ec0ba00a8d06c1033d"
    else
      url "https://github.com/levifig/loaf/releases/download/v2.0.0-alpha.3/loaf_2.0.0-alpha.3_linux-x64.tar.gz"
      sha256 "4e43fa4cdeaa8badbf6199078134abd7e9bb70524ebbd07ffb7b99a96e7ff6ee"
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
