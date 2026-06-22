class Ds4color < Formula
  include Language::Python::Virtualenv

  desc "Set the DualShock 4 lightbar to a solid colour on macOS over USB or Bluetooth"
  homepage "https://github.com/bitmap4/ds4-lightbar-macos"
  url "https://github.com/bitmap4/ds4-lightbar-macos/releases/download/v1.0.0/ds4color-1.0.0.tar.gz"
  sha256 "4c9cb91c8e13f2d868cd8fe91fc211b1ec49a783be63030a4ad9211c31e0aae3"
  license "MIT"

  depends_on "hidapi"
  depends_on "python@3.13"

  resource "hidapi" do
    url "https://files.pythonhosted.org/packages/74/f6/caad9ed701fbb9223eb9e0b41a5514390769b4cb3084a2704ab69e9df0fe/hidapi-0.15.0.tar.gz"
    sha256 "ecbc265cbe8b7b88755f421e0ba25f084091ec550c2b90ff9e8ddd4fcd540311"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "blue", shell_output("#{bin}/ds4color list")
  end
end
