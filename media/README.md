# 📼 Media & Emulation

This directory contains the automated pipelines for managing your game library. These scripts are designed to be run inside the **Exodia Toolkit** container or on a Linux host with `mame-tools` and `dolphin-emu` installed.

## 📂 The Arsenal

| Tool | Location | Description |
| :--- | :--- | :--- |
| **CHD Manager** | `emulation/chd_manager.sh` | **The Heavy Lifter.** Recursively converts, verifies, and repairs optical media (PS1, PS2, Saturn, etc). |
| **RVZ Manager** | `emulation/rvz_manager.sh` | **The Specialist.** Manages GameCube/Wii compression (ISO $\to$ RVZ) using Dolphin. |

---

## 💿 CHD Manager
**Supported Systems:** PS1, PS2, Sega CD, Saturn, Dreamcast, PC Engine CD.  
**Auto-Excludes:** GameCube, Wii, Wii U, Xbox.

### Usage
```bash
./emulation/chd_manager.sh -d <TARGET_DIR> [OPTIONS]

Mode,Description
convert,(Default) Converts ISO/CUE to CHD. Verifies integrity before deleting source.
revert,Extracts CHD back to ISO/BIN+CUE.
repair,"PS2 Fix. Detects bad ""DVD-style"" CHDs (created with createdvd) and re-encodes them correctly."
verify,Runs a full integrity check (chdman verify) on all files.
cleanup,"Scans for duplicates (e.g., deletes .iso if a valid .chd exists)."
