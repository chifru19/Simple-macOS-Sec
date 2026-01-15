simple-macos-sec 🛡️
A lightweight security toolkit for macOS environments and cloud infrastructure. This project provides a Bash-based auditor for local system health checks and Terraform logic for managing cloud security groups.

Features
💻 macOS Security Auditor (mac_audit.sh)
✅ Firewall Audit: Verifies if the macOS Application Firewall is active.

🕵️ Stealth Mode Check: Ensures the system is hidden from network probes (pings).

🔒 FileVault Verification: Checks if full-disk encryption is enabled.

📡 Anomaly Detection: Compares current listening ports against a known baseline.

⚠️ Sharing Alert: Flags dangerous active services (Screen Sharing, SSH, etc.).

☁️ Cloud Security
🛡️ Security Group Logic (Task F2): Terraform configurations to define and manage cloud-based firewall rules and access control lists.
