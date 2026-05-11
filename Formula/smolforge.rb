# typed: strict
# frozen_string_literal: true

# Command-line interface for the SmolForge API.
class Smolforge < Formula
  desc "Command-line interface for the SmolForge API"
  homepage "https://forge.smol.ai/llms.txt"
  url "https://github.com/smol-ai/homebrew-tap/releases/download/smolforge-v0.1.0/smolai-forge-0.1.0.tgz"
  sha256 "8b124998a8b4d84133874edf2cfb332b4262e33546dbb6670514c7454952b356"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    bin.install_symlink libexec/"bin/sf"
    bin.install_symlink libexec/"bin/smolforge"
  end

  test do
    assert_match "SmolForge CLI", shell_output("#{bin}/sf --help")
  end
end
