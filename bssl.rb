class Bssl < Formula
  desc "BoringSSL is a fork of OpenSSL that is designed to meet Google's needs"
  homepage "https://boringssl.googlesource.com/boringssl/"
  url "https://boringssl.googlesource.com/boringssl/+archive/1607f54fed72c6589d560254626909a64124f091.tar.gz"
  version "1607f54fed72c6589d560254626909a64124f091"
  sha256 "ee6e653f86018ec3731527c89ef36f474c0ba812d52fbd53443001e10404d35f"

  depends_on "cmake"
  depends_on "go"
  depends_on "ninja"

  def install
    mkdir "build" do
      system "cmake", "-GNinja", ".."
      system "ninja"
      bin.install "tool/bssl"
    end
  end

  test do
    assert_match "0", shell_output("#{bin}/bssl isfips 2>&1")
  end
end
