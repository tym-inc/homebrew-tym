class Tym < Formula
  desc "Instant Code Collaboration"
  homepage "https://tym.so"
  url "https://github.com/tym-inc/homebrew-tym/releases/download/brew-cli-0.4/tym-cli.tar.gz"
  sha256 "c3340e22d571ef688eaa4be94690297e47ed44f3cee9ad360909ea74605e3886"
  license ""

  # depends_on "cmake" => :build

  depends_on "yarn" => :build
  depends_on "node@14"
  


  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
        
    system "sh #{prefix}/augment_brew.sh"


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
