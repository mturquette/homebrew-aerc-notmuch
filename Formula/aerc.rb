class Aerc < Formula
  desc "Email client that runs in your terminal (with notmuch support)"
  homepage "https://aerc-mail.org/"
  url "https://git.sr.ht/~rjarry/aerc/archive/0.11.0.tar.gz"
  sha256 "3d8f3a2800946fce070e3eb02122e77c427a61c670a06337539b3e7f09e57861"
  license "MIT"
  head "https://git.sr.ht/~rjarry/aerc", branch: "master"

  depends_on "go" => :build
  depends_on "scdoc" => :build

  def install
    ENV["GOFLAGS"] = "-tags=notmuch"
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/aerc", "-v"
  end
end
