# Copyright faelau.
# SPDX-License-Identifier: MPL-2.0

class Talm < Formula
    desc "Manage Talos Linux the GitOps Way!"
    homepage "https://github.com/aenix-io/talm/"
    version "0.8.2"
    license "MPL-2.0"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-darwin-amd64",
        verified: "github.com/aenix-io/talm/"
      sha256 "17930c44916dd431621916b6c6a6ef786a96f6a13dcd46d0501867e2ea43174b"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-darwin-arm64",
        verified: "github.com/aenix-io/talm/"
      sha256 "6a48996dd9d6896d3e647f0baa644529c59e37fa35388ede5b16f7dd780026ea"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-linux-amd64",
        verified: "github.com/aenix-io/talm/"
      sha256 "250583e1d0d899897b7f276c2e3e14c9de068fc5b89ed6106bc2f7562b2283b5"
    elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-linux-arm64",
        verified: "github.com/aenix-io/talm/"
      sha256 "8454b77ee98cc7bae9ca349af096f3ac537d72005f59014cc6c60f6fde0c1e1c"
    else
      odie "Unexpected platform!"
    end
  
    def install
      if OS.mac? && Hardware::CPU.intel?
        bin.install "talm-darwin-amd64" => "talm"
      elsif OS.mac? && Hardware::CPU.arm?
        bin.install "talm-darwin-arm64" => "talm"
      elsif OS.linux? && Hardware::CPU.intel?
        bin.install "talm-linux-amd64" => "talm"
      elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "talm-linux-arm64" => "talm"
      end
    end
  
    def post_install
      generate_completions_from_executable(bin/"talm", "completion")
    end
  
    test do
      system "#{bin}/talm" "--version"
    end
  end
