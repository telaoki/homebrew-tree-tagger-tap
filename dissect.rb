require "formula"

class Dissect < Formula
  homepage "http://clic.cimec.unitn.it/composes/toolkit/"
  head "https://github.com/composes-toolkit/dissect", :using => :git

  depends_on "python"    => :build
  depends_on "numpy"     => :python
  depends_on "scipy"     => :python
  depends_on "sparsesvd" => :python


  def install
    system "python setup.py install"
  end

  test do
    system "false"
  end
end
