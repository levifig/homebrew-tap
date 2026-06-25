class Loaf < Formula
  desc "Opinionated agentic framework for AI coding assistants"
  homepage "https://github.com/levifig/loaf"
  version "2.0.0-pre.20260625183349"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-arm64.tar.gz"
      sha256 "310fceedf68fd96bdba205644d632752047d345ade2f36aebe2ae136d946d631"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_darwin-x64.tar.gz"
      sha256 "df9f5f25957bfa24923582fc91f3f1eec6d2348758535434dc50c64615578285"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-arm64.tar.gz"
      sha256 "69b5500d096ec8edd79f5f3d1dae67084901ef667624063595a4aab1adaf3e5a"
    else
      url "https://github.com/levifig/loaf/releases/download/v#{version}/loaf_#{version}_linux-x64.tar.gz"
      sha256 "c95cfd27c24aa2df8360cc316d21b5fbd4dcbeff052ab7343bf1f237490df7dd"
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
