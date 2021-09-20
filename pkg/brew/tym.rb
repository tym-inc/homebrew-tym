class TymBin < Formula
  version '0.0.1'
  desc "Cli for Tym Editor"
  homepage "https://github.com/tym-inc/homebrew-tym"

  if OS.mac?
    url ""
    sha256 ""
  elsif OS.linux?
    url "https://github.com/tym-inc/homebrew-tym/releases/download/0.0.1/tym-0.0.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a3f2a3767ee63d3f259d3e379670deb0cc6e727ecc8ac1e4f8241b355b444d6f"
  end

  def install
    bin.install "tym"
  end
end
