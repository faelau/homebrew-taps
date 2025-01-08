# Copyright faelau.
# SPDX-License-Identifier: MPL-2.0

class Talm < Formula
    desc "Manage Talos Linux the GitOps Way!"
    homepage "https://github.com/aenix-io/talm/"
    version "0.7.0"
    license "MPL-2.0"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-darwin-amd64",
        verified: "github.com/aenix-io/talm/"
      sha256 "67e66671832f475d33dfd46a6cc294bb8be3e883289bea854cf31bd5ed5c6e7a"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-darwin-arm64",
        verified: "github.com/aenix-io/talm/"
      sha256 "b66e32ab3d69b56f6f74bddc40fe2053c3eb8349f0446e9dc710769526c1b596"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-linux-amd64",
        verified: "github.com/aenix-io/talm/"
      sha256 "3d1a9ad04e391018bdae41bac210471cd477afbd3c44791f288c5992294b20a8"
    elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/aenix-io/talm/releases/download/v#{version}/talm-linux-arm64",
        verified: "github.com/aenix-io/talm/"
      sha256 "2a6df9b62f9ddeaf65a4c07b1acc22623fb0cd9432e8d84ab11f73e1579f1a6f"
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