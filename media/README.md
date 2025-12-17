#🕹️ Emulation & Media Management
This directory contains the automation pipelines for optimizing and maintaining your ROM library. These scripts are designed to be run inside the Exodia Toolkit container or on a Linux host with mame-tools and dolphin-emu installed.
📂 The Arsenal
Tool
Filename
Description
CHD Manager
chd_manager.sh
The Heavy Lifter. Recursively converts, verifies, and repairs optical media (PS1, PS2, Saturn, etc).
RVZ Manager
rvz_manager.sh
The Specialist. Manages GameCube/Wii compression (ISO -> RVZ) using Dolphin.

# 💿 CHD Manager
Supported Systems: PS1, PS2, Sega CD, Saturn, Dreamcast, PC Engine CD.
Auto-Excludes: GameCube, Wii, Wii U, Xbox.

## Usage
```bash
./chd_manager.sh -d <TARGET_DIR> [OPTIONS]
```

## Modes (-m)
| **`convert`** | **(Default)** Converts ISO/CUE to CHD. Verifies integrity before deleting source. |
| **`revert`** | Extracts CHD back to ISO/BIN+CUE. |
| **`repair`** | **PS2 Fix.** Detects bad "DVD-style" CHDs (created with `createdvd`) and re-encodes them correctly. |
| **`verify`** | Runs a full integrity check (`chdman verify`) on all files. |
| **`cleanup`** | Scans for duplicates (e.g., deletes `.iso` if a valid `.chd` exists). |

## Examples
```bash
# Convert all PS2 games (Recursive)
./chd_manager.sh -d /data/ps2

# Fix a PS2 library that fails to load in NetherSX2
./chd_manager.sh -d /data/ps2 -m repair

# Dry Run: Check for duplicates without deleting
./chd_manager.sh -d /data/dreamcast -m cleanup -n
```

## 🐬 RVZ Manager
Supported Systems: GameCube, Wii.
Settings: RVZ Format, ZStandard (Level 5).
Usage
```bash
./rvz_manager.sh -d <TARGET_DIR> [OPTIONS]
```
## Modes (-m)
| **`convert`** | **(Default)** ISO/GCM -> RVZ. Removes NKit junk automatically. |
| **`revert`** | Decodes RVZ back to 1:1 ISO. |
| **`verify`** | Runs `dolphin-tool verify` on all files. |
| **`cleanup`** | Deletes redundant `.iso` or `.gcm` files if a verified `.rvz` exists. |

## Examples
### Compress GameCube library
```bash
./rvz_manager.sh -d /data/gamecube
```
### Revert a specific Wii game to ISO
```bash
./rvz_manager.sh -d /data/wii/smash_brawl -m revert
```

## 🚩 Global Flags
Both scripts share these standard flags:
| `-d <path>` | **Required.** The root directory to scan. |
| `-n` | **Dry Run.** Print actions to log without making changes. |
| `-f` | **Flat Scan.** Disable recursion (process only the top folder). |
| `-l <file>` | Custom log file path (Default: `/var/log/...`). |

## ⚠️ Troubleshooting
"Command not found" or "Permission denied"
Make sure the scripts are executable:

```bash
chmod +x *.sh
```
```bash
"chdman/dolphin-tool not found"
These scripts are logic controllers. They do not contain the binaries. You must run them in an environment that has the tools installed (like the Exodia Toolkit container).
"My PS2 game isn't recognized"
If you previously converted PS2 ISOs using an older script or createdvd, emulators like NetherSX2 may not load them. Run:
```

```bash
./chd_manager.sh -d <path> -m repair
```
