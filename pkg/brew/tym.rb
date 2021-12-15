class Tym < Formula
  desc "Instant Code Collaboration"
  homepage "https://tym.so"
  url "https://github.com/tym-inc/homebrew-tym/releases/download/brew-cli-0.2/tym_cli_0.2.tar.gz"
  sha256 "481681163edf90aafbbed3c45668a328eca371d8cec4394be569e9c19c792d1a"
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
    prefix.install 
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
        <string>/opt/homebrew/bin/tym</string>
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
