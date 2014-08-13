require "formula"

class Maltparser < Formula
  homepage "http://www.maltparser.org/"
  url "http://maltparser.org/dist/maltparser-1.8.tar.gz"
  sha1 "9cee06e4bcd0ea46074b75a386a35a0d21842df7"

  def install
    File.open("malt", 'w', 0755) do |fp|
      fp.write <<-eos
        #!/bin/bash
        java -jar #{libexec}/maltparser-1.8.jar $@
      eos
    end

    libexec.install Dir['*']

    bin.install_symlink Dir["#{libexec}/malt"]
  end

  test do
    system "malt"
  end
end
