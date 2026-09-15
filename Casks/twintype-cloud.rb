cask "twintype-cloud" do
  version "1.0.4"
  sha256 "da234a925e8e7f14a19efcb641cabc9348b7d515554af4abb1805cbe77da939f"

  url "https://cloud-api.twintype.co/api/downloads/version/mac/#{version}",
      verified: "cloud-api.twintype.co/api/downloads/version/mac/"
  name "TwinType Cloud"
  desc "Font rental desktop client for TwinType Cloud"
  homepage "https://cloud.twintype.co/"

  livecheck do
    url "https://cloud-api.twintype.co/api/downloads/latest"
    strategy :json do |json|
      json["mac"]&.dig("version")
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "twintype-cloud.app"

  zap trash: [
    "~/Library/Application Support/co.twintype.cloud",
    "~/Library/Caches/co.twintype.cloud",
    "~/Library/HTTPStorages/co.twintype.cloud",
    "~/Library/Preferences/co.twintype.cloud.plist",
    "~/Library/Saved Application State/co.twintype.cloud.savedState",
  ]
end
