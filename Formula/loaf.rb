class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.3.1/loaf_0.3.1_darwin-arm64.tar.gz"
      sha256 "3b15c9853bf59ea3fc3167b7fc0cd377561c7c185728f7f192a53dabbd94021f"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.3.1/loaf_0.3.1_darwin-x64.tar.gz"
      sha256 "8ccdb26520f58bd605cfac18838525bd132626505e6f0b2fd0f0a3cd6def40ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v0.3.1/loaf_0.3.1_linux-arm64.tar.gz"
      sha256 "48cdb4e48c8d22e3a31249c33731ce2b809600ad6fa2e5c7ec04db1174ffae4d"
    else
      url "https://github.com/levifig/loaf/releases/download/v0.3.1/loaf_0.3.1_linux-x64.tar.gz"
      sha256 "1102328a7c876c273b6c0236556acb80e93d255ad3cdc86a80c9cce8c64b5800"
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
