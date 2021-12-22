class Tym < Formula
  desc "Instant Code Collaboration"
  homepage "https://tym.so"
  url "https://github.com/tym-inc/homebrew-tym/releases/download/brew-cli-0.4/tym-cli.tar.gz"
  sha256 "9289a0631eb68da0b5f83f71241c488539fd69165b51a2a3093a0676006536d1"
  license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "tym"
    prefix.install "package.json"
    prefix.install "node" 
    prefix.install "product.json"
    prefix.install Dir["node_modules"]
    prefix.install Dir["extensions"]
    prefix.install Dir["out"]

  end




  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>homebrew.mxcl.tym</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/tym</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>StandardErrorPath</key>
      <string>#{var}/log/tym.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/tym.log</string>
      <key>WorkingDirectory</key>
	    <string>#{ENV["HOME"]}</string>
    </dict>
    </plist>
    EOS
  end


  test do
    system "false"
  end
end
