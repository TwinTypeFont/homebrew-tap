cask "twintype-cloud" do
  version "1.1.0"
  sha256 "3a74a862f9e4a70d6fb90dfbfbf25e0c2401f6ff59c437bd13d16050dd243d73"

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
