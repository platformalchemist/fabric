class FabricAi < Formula
  desc "Open-source framework for augmenting humans using AI"
  homepage "https://github.com/platformalchemist/Fabric"
  url "https://github.com/platformalchemist/Fabric/archive/refs/tags/v1.4.245.tar.gz"
  sha256 "2fc4ad616339a27cd71edcbb0e0b5d3107c3414852437711cb1353376ac108f6"
  license "MIT"
  head "https://github.com/platformalchemist/Fabric.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/fabric"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabric-ai --version")
  end
end
