class TymBin < Formula
  version '0.0.1'
  desc "Cli for Tym Editor"
  homepage "https://github.com/tym-inc/homebrew-tym"

  if OS.mac?
    url ""
    sha256 ""
  elsif OS.linux?
    url ""
    sha256 ""
  end

  def install
    bin.install "tym"
  end
end
