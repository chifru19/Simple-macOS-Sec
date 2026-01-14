# simple-macos-sec 🛡️

A lightweight Bash-based security auditor for macOS. This tool provides a quick health check of core security settings and monitors for unauthorized network listeners.

## Features
- ✅ **Firewall Audit**: Verifies if the macOS Application Firewall is active.
- 🕵️ **Stealth Mode Check**: Ensures the system is hidden from network probes (pings).
- 🔒 **FileVault Verification**: Checks if full-disk encryption is enabled.
- 📡 **Anomaly Detection**: Compares current listening ports against a known baseline.
- ⚠️ **Sharing Alert**: Flags dangerous active services (Screen Sharing, SSH, etc.).

## Installation & Setup
1. Clone the repository:
   `git clone https://github.com/YOUR_USERNAME/simple-macos-sec.git`
2. Make the script executable:
   `chmod +x mac_audit.sh`

## Usage
Run the script to perform a live security audit:
`./mac_audit.sh`

*Note: The first run will generate a `security_baseline.txt`. Subsequent runs will alert you if any **new** ports are opened.*
