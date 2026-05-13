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
  def caveats
    <<~EOS
      Install:
        #{libexec}/install.sh                              # macmon serve on this Mac
        #{libexec}/install.sh --install-remote user@host   # macmon serve on a remote Mac
        #{libexec}/install.sh --install-webui              # dashboard (http://localhost:7113/)

      Uninstall (run before `brew uninstall`):
        #{libexec}/install.sh --uninstall
        #{libexec}/install.sh --uninstall-remote user@host
        #{libexec}/install.sh --uninstall-webui
    EOS
  end
  
  test do
    assert_path_exists libexec/"webui.py"
  end
end
