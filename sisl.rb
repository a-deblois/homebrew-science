require "formula"

class Sisl < Formula
  homepage "http://www.sintef.no/Informasjons--og-kommunikasjonsteknologi-IKT/Anvendt-matematikk/Fagomrader/Geometri/Prosjekter/The-SISL-Nurbs-Library/SISL-Homepage/"
  url "https://github.com/SINTEF-Geometry/SISL/archive/SISL-4.6.0.tar.gz"
  sha1 "d86d626408164bea53a129945b09146085c90325"

  head "https://github.com/SINTEF-Geometry/SISL.git", :branch => "master"

  option "with-docs-examples", "Build and install html documentation and examples"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    if MacOS.prefer_64_bit?
      args << "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.arch_64_bit}"
    else
      args << "-DCMAKE_OSX_ARCHITECTURES=i386"
    end

    mkdir "build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end
  end
end
