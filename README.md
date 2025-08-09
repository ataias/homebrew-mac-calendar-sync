# Homebrew Tap for MacCalendarSync

This is a Homebrew tap for [MacCalendarSync](https://github.com/ataias/MacCalendarSync), a command line tool that allows you to sync events between calendars on macOS.

## Installation

```bash
# Add the tap
brew tap ataias/mac-calendar-sync

# Install the tool
brew install mac-calendar-sync
```

## Usage

After installation, you can use the `mac-calendar-sync` command:

```bash
mac-calendar-sync --help
```

For detailed usage instructions, see the [main repository](https://github.com/ataias/MacCalendarSync).

## Requirements

- macOS only (uses native Calendar framework)
- Xcode 15.0 or later (for building)