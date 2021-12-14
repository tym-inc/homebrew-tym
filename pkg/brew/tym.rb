class TymBin < Formula
  version '0.0.1'
  desc "Cli for Tym Editor"
  homepage "https://github.com/tym-inc/homebrew-tym"

  if OS.linux?
    url ""
    sha256 ""
  elsif OS.mac?
    url "https://github.com/tym-inc/homebrew-tym/releases/download/0.0.2/tym.tar.gz"
    sha256 "db238757c2a2cb2dd82390f565c8f3168c8839bef911b8b11c3b16c305a1ed59"
  end

  def install
    bin.install "tym"
  end
end
