# Homebrew Tap Release

1. Create a GitHub release in your main repository with a version tag (e.g., v1.0.0)
2. Get the SHA256 of the release tarball:
   curl -sL https://github.com/ataias/MacCalendarSync/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
3. Update the formula by replacing REPLACE_WITH_ACTUAL_SHA256 with the actual checksum
4. Push the tap repository to GitHub as homebrew-mac-calendar-sync
5. Test the formula locally:
   brew install --formula --build-from-source ./Formula/mac-calendar-sync.rb
