# 🛡️ Root Kit

**The Automaton for the Exodia Homelab.**

> *A centralized arsenal of Bash scripts for server hardening, media automation, backups, and infrastructure management on Unraid/Linux.*

![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Unraid%20%7C%20Linux-blue?style=flat-square)
![Language](https://img.shields.io/badge/language-Bash-orange?style=flat-square)

---

## 📂 Modules

### 📼 Media & Emulation (`/media`)
Tools to optimize and manage large media libraries (ROMs, Movies, etc).

| Tool | Description |
| :--- | :--- |
| **`chd_manager.sh`** | Recursively converts ISO/CUE to CHD with verification & auto-repair. |
| **`rvz_manager.sh`** | Manages GameCube/Wii compression (ISO -> RVZ) via Dolphin. |

### 💾 Backups & Data (`/backups`)
Scripts to secure critical data off-site.

| Tool | Description |
| :--- | :--- |
| **`save_sentinel.sh`** | *[Coming Soon]* Auto-syncs game saves from local Docker containers to Cloud (Rclone). |

### ⚙️ System Operations (`/system`)
Maintenance and integrity tasks.

| Tool | Description |
| :--- | :--- |
| **`tripwire.sh`** | *[Coming Soon]* File integrity monitor to detect unauthorized changes to config files. |

---

## 🚀 Installation

Clone this repository to a persistent location on your server (e.g., `/mnt/user/Scripts`).

```bash
# 1. Enter your scripts directory
cd /mnt/user/Scripts

# 2. Clone the arsenal
git clone [https://github.com/corruptcache/root-kit.git](https://github.com/corruptcache/root-kit.git)

# 3. Make executable
chmod +x root-kit/**/*.sh

🛠️ Usage Examples
Optimize a PS2 Library
Bash

./root-kit/media/chd_manager.sh -d /mnt/user/Games/PS2 -m convert
Dry-Run a Nintendo Cleanup
Bash

./root-kit/media/rvz_manager.sh -d /mnt/user/Games/GameCube -m cleanup -n
🛡️ Safety Protocols
All scripts in this kit adhere to the "Verify-First" doctrine:

Verification: No source file is deleted until the operation is verified successful.

Dry Runs: All destructive scripts support a -n flag to simulate actions.

Self-Healing: Scripts attempt to repair or safely exit upon encountering errors.

⚖️ License
MIT License - Copyright (c) 2025 Corrupt Cache


### Next Steps for You:
1.  **Move the files:** On your computer or server, create the folders (`mkdir media system backups`) and move your existing `.sh` files into `media/`.
2.  **Update the README:** Replace your old README with this new one.
3.  **Commit & Push:** This establishes the new "Professional SysAdmin" baseline for your repo.
