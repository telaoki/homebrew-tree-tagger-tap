require "formula"

class TreeTagger < Formula

  homepage "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/"
  url "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tree-tagger-MacOSX-3.2.2.tar.gz"
  sha256 "6480771ed6f30af729d46c08fbe02aa01c17299241b724111b53cf41093f9f13"
  version "3.2.2"

  # commands for semi-automatically generating script...
  # wget "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/index.html";cat index.html | pup 'a json{}' | jq '.[] | {text:.text,href:.href} | select(.href != null and (.text | test("parameter file")) and (.href | test("gz$"))) | (.text | sub("\n";" ")) + "|" +.href' -r > x;cat x | cut -d'|' -f1 | sed -E 's:[ ]+parameter file.*$::' | uniq | awk -v 'OFS=|' '{print tolower($0),$0}' | tr ' ' '-' | sed -E 's:(.*)\|(.*):option "with-\1"|, "Install \2 parameter files.":' | sed -e 's:with-english:without-english:' -e 's:Install English:Do not install English:' | column -s '|' -t;cat x| sed -n -E 's:^(.+[a-zA-Z]) (chunker){0,1}[ ]*parameter file([ ]*[^|]*)\|([^|]+)$:\4|\1|\2:p;' | tr ' ' '-' | tr '|' ' ' | uniq -f 1 | awk '{print $1,tolower($2),$3?"-"$3:""}' | sed -E "s|(.*) (.*) (.*)|if build.with? \"\2\3\""$'\\\n'"  system \"wget\", \"http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/\1\""$'\\\n'"end|" | sed 's:if build.with\? "english:unless build.without? "english:'

  option "with-bulgarian"           , "Install Bulgarian parameter files."
  option "with-catalan"             , "Install Catalan parameter files."
  option "with-czech"               , "Install Czech parameter files."
  option "with-danish"              , "Install Danish parameter files."
  option "with-dutch"               , "Install Dutch parameter files."
  option "without-english"          , "Do not install English parameter files."
  option "with-estonian"            , "Install Estonian parameter files."
  option "with-finnish"             , "Install Finnish parameter files."
  option "with-french"              , "Install French parameter files."
  option "with-galician"            , "Install Galician parameter files."
  option "with-german"              , "Install German parameter files."
  option "with-middle-high-german"  , "Install Middle-High-German parameter files."
  option "with-greek"               , "Install Greek parameter files."
  option "with-italian"             , "Install Italian parameter files."
  option "with-korean"              , "Install Korean parameter files."
  option "with-latin"               , "Install Latin parameter files."
  option "with-mongolian"           , "Install Mongolian parameter files."
  option "with-polish"              , "Install Polish parameter files."
  option "with-portuguese"          , "Install Portuguese parameter files."
  option "with-romanian"            , "Install Romanian parameter files."
  option "with-russian"             , "Install Russian parameter files."
  option "with-slovak"              , "Install Slovak parameter files."
  option "with-slovenian"           , "Install Slovenian parameter files."
  option "with-spanish"             , "Install Spanish parameter files."
  option "with-swahili"             , "Install Swahili parameter files."

  option "without-english-chunker"  , "Do not install English-chunker parameter files."
  option "with-french-chunker"      , "Install French-chunker parameter files."
  option "with-german-chunker"      , "Install German-chunker parameter files."
  option "with-spanish-chunker"     , "Install Spanish-chunker parameter files."

  depends_on "wget" => :build

  def install
    system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tagger-scripts.tar.gz"

    if build.with? "bulgarian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/bulgarian.par.gz"
    end
    if build.with? "catalan"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/catalan.par.gz"
    end
    if build.with? "czech"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/czech.par.gz"
    end
    if build.with? "danish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/danish.par.gz"
    end
    if build.with? "dutch"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/dutch.par.gz"
    end
    unless build.without? "english"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/english.par.gz"
    end
    if build.with? "estonian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/estonian.par.gz"
    end
    if build.with? "finnish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/finnish.par.gz"
    end
    if build.with? "french"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/french.par.gz"
    end
    if build.with? "galician"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/galician.par.gz"
    end
    if build.with? "german"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/german.par.gz"
    end
    if build.with? "middle-high-german"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/middle-high-german.par.gz"
    end
    if build.with? "greek"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/greek.par.gz"
    end
    if build.with? "italian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/italian.par.gz"
    end
    if build.with? "korean"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/korean.par.gz"
    end
    if build.with? "latin"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/latin.par.gz"
    end
    if build.with? "mongolian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/mongolian.par.gz"
    end
    if build.with? "polish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/polish.par.gz"
    end
    if build.with? "portuguese"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/portuguese.par.gz"
    end
    if build.with? "romanian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/romanian.par.gz"
    end
    if build.with? "russian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/russian.par.gz"
    end
    if build.with? "slovak"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/slovak.par.gz"
    end
    if build.with? "slovenian"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/slovenian.par.gz"
    end
    if build.with? "spanish"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/spanish.par.gz"
    end
    if build.with? "swahili"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/swahili.par.gz"
    end

    unless build.without? "english-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/english-chunker.par.gz"
    end
    if build.with? "french-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/french-chunker.par.gz"
    end
    if build.with? "german-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/german-chunker.par.gz"
    end
    if build.with? "spanish-chunker"
      system "wget", "http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/spanish-chunker.par.gz"
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


  def caveats; <<~EOS
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
