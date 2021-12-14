# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tym < Formula
  desc "Instant Code Collaboration"
  homepage "https://tym.so"
  url "https://github.com/tym-inc/homebrew-tym/releases/download/0.0.2/tym.tar.gz"
  sha256 "db238757c2a2cb2dd82390f565c8f3168c8839bef911b8b11c3b16c305a1ed59"
  license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "cli.sh"
    bin.install "install.sh"
    bin.install "package.json"
    bin.install "tym_install.sh"
    bin.install "node" 
    bin.install "product.json"
    bin.install Dir["node_modules"]
    bin.install Dir["extensions"]
    bin.install Dir["out"]

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test homebrew-tym`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
