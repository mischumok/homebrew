require 'formula'

class ShellFm < Formula
  url 'https://github.com/jkramer/shell-fm/tarball/v0.8'
  homepage 'http://nex.scrapping.cc/shell-fm/'
  md5 'ce5c45ead71a299edbff280d4007ad99'
  head 'https://github.com/jkramer/shell-fm.git'

  # homepage says that libao is optional, but it doesn't seem
  # to build without it
  depends_on 'pkg-config' => :build
  depends_on 'libao'
  depends_on 'mad'

  def patches
    # fixes something small
    DATA
  end

  def install
    system "make"
    bin.install 'source/shell-fm'
    man1.install 'manual/shell-fm.1.gz'
  end
end

__END__
diff --git a/source/play.c b/source/play.c
index 53a1e98..6c0cc51 100644
--- a/source/play.c
+++ b/source/play.c
@@ -206,7 +206,7 @@ int playback(FILE * streamfd, int pipefd) {
 
 		freetrack = value(& track, "freeTrackURL");
 
-		if(freetrack && strlen(freetrack) > 0 && haskey(& rc, "download")) {
+		if(haskey(& rc, "download")) {
 			char * dnam;
 			int rv;
 

