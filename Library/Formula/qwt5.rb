require 'formula'

class Qwt5 < Formula
  url 'http://sourceforge.net/projects/qwt/files/qwt/5.2.2/qwt-5.2.2.tar.bz2'
  homepage 'http://qwt.sourceforge.net/'
  md5 '70d77e4008a6cc86763737f0f24726ca'

  depends_on 'qt'

  def install
    inreplace 'qwtconfig.pri' do |s|
      s.gsub! /^\s*INSTALLBASE\s*=(.*)$/, "INSTALLBASE=#{prefix}"
      s.gsub! /^\s*headers.path\s*=(.*)$/, "headers.path=$$INSTALLBASE/include/qwt"
    end

    system "qmake -spec macx-g++ -config release" 
    system "make"	
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test qwt`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
