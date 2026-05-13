class MacmonWebui < Formula
  desc "Multi-host web dashboard for macmon"
  homepage "https://github.com/Zanshinmu/macmon-webui"
  url "https://github.com/Zanshinmu/macmon-webui/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fb64c0735decbb943fe38765b412bbe41dc6f033c5aae1d5544e78d53ec085f1"
  license "MIT"

  depends_on "macmon"
  depends_on :macos

  def install
    libexec.install "webui.py", "index.html", "install.sh"
  end

  def post_install
    system libexec/"install.sh", "--install-webui"
  end

  def caveats
    <<~EOS
      The dashboard is running at http://localhost:7113/
      To uninstall the launchd agent before `brew uninstall`:
        #{libexec}/install.sh --uninstall-webui
    EOS
  end

  test do
    assert_predicate libexec/"webui.py", :exist?
  end
end
