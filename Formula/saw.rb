class Saw < Formula
  desc ""
  homepage "https://github.com/TylerBrock/saw"
  url "https://github.com/TylerBrock/saw.git"
  version "0.0.2"
  head "https://github.com/TylerBrock/saw.git" 

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/TylerBrock/saw").install buildpath.children
    cd "src/github.com/TylerBrock/saw" do
      system "dep", "ensure"
      system "go", "build", "saw.go"
      bin.install "saw"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/saw --version")
  end
end
