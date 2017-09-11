require "formula"

class TreeTagger < Formula

  homepage "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/"
  url "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tree-tagger-MacOSX-3.2.tar.gz"
  sha256 "49664b53e6478ef9db3a36fbc06fc83dcea60409064fefe92e107612753590a9"
  version "3.2"

  option "without-english"         , "Do not install English parameter files."
  option "with-bulgarian"          , "Install Bulgarian parameter files."
  option "with-dutch"              , "Install Dutch parameter files."
  option "with-estonian"           , "Install Estonian parameter files."
  option "with-finnish"            , "Install Finnish parameter files."
  option "with-french"             , "Install French parameter files."
  option "with-galician"           , "Install Galician parameter files."
  option "with-german"             , "Install German parameter files."
  option "with-italian"            , "Install Italian parameter files."
  option "with-latin"              , "Install Latin parameter files."
  option "with-mongolian"          , "Install Mongolian parameter files."
  option "with-polish"             , "Install Polish parameter files."
  option "with-russian"            , "Install Russian parameter files."
  option "with-slovak"             , "Install Slovak parameter files."
  option "with-spanish"            , "Install Spanish parameter files."
  option "with-swahili"            , "Install Swahili parameter files."

  option "without-english-chunker" , "Do not install English chunker parameter files."
  option "with-french-chunker"     , "Install French chunker parameter files."
  option "with-german-chunker"     , "Install German chunker parameter files."


  depends_on "wget" => :build


  def install
    system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tagger-scripts.tar.gz"

    unless build.without? "english"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/english-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "bulgarian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/bulgarian-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "dutch"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/dutch-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "estonian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/estonian-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "finnish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/finnish-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "french"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/french-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "galician"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/galician-par-linux-3.2.bin.gz"
    end
    if build.with? "german"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/german-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "italian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/italian-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "latin"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/latin-par-linux-3.2.bin.gz"
    end
    if build.with? "mongolian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/mongolian-par-linux-3.2.bin.gz"
    end
    if build.with? "polish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/polish-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "russian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/russian-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "slovak"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/slovak-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "spanish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/spanish-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "swahili"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/swahili-par-linux-3.2.bin.gz"
    end

    unless build.without? "english-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/english-chunker-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "french-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/french-chunker-par-linux-3.2-utf8.bin.gz"
    end
    if build.with? "german-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/german-chunker-par-linux-3.2-utf8.bin.gz"
    end

    system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/install-tagger.sh"
    system "chmod", "+x", "./install-tagger.sh"
    system "./install-tagger.sh"

    Dir["cmd/*"].each do |cmd_file|
      begin
        inreplace cmd_file do |cmd_text|
          cmd_text.gsub!(/BIN=.*/, "BIN=#{libexec}/bin")
          cmd_text.gsub!(/CMD=.*/, "CMD=#{libexec}/cmd")
          cmd_text.gsub!(/LIB=.*/, "LIB=#{libexec}/lib")
        end
        rescue
          #uncoment to enable verbose mode:
          #puts "Warning: lines to replace not found in #{cmd_file}"
      end
    end

    rm "install-tagger.sh"

    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
    bin.install_symlink Dir["#{libexec}/cmd/*"]
  end

  
  def caveats; <<-EOS.undent
     You may want to add to your path 
      #{libexec}/bin 
      and 
      #{libexec}/cmd.
     EOS
  end
  
  
  test do
    system "false"
  end
end
