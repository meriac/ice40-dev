This template provides a simple, browser based way to write and synthesize code for Lattice iCE40 FPGAs—including boards like the iCEBreaker, iCESugar, and more.

By creating a GitHub Codespace from this public template, you can get up and running with your FPGA projects in just minutes. No installation required!

# First-Time Setup

Welcome! Follow these quick steps to get started:

1. Click **“Use this template”** at the top of the repository.
2. Select **“Open in a codespace.”**

That's it—your Codespace will launch with a pre-configured online VS Code environment!

### Getting Started

1. In your Codespace, open the `Examples` folder.
2. Modify `apio.ini` to match your specific board.
3. Update the `io.pcf` file to reflect your board's LED pin configuration.
4. Follow the build instructions in the next section to compile and flash your example.

### Saving Your Work

All changes within the Codespace are saved **inside the Codespace**, but **not pushed to GitHub** by default.

To keep your work:

- **Fork** this repository first (if you haven’t already).
- **Commit and push** your changes from within the Codespace.

> ⚠️ Note: Codespaces may be automatically deleted after a period of inactivity. Be sure to disable auto-deletion in your Codespaces settings if needed, and always keep backups of your important work!

# Code Creation & FPGA Programming

### Code Creation

GitHub Codespaces is used for writing code and generating programming files. It’s pre-configured to make development easy and consistent across platforms—no installation required.

- Open the Codespace in the browser to launch the online VS Code instance.
- Modify an existing Verilog file directly, or duplicate and rename a folder to create a new project.
- In the vscode terminal, navigate to the folder containing your Verilog file (e.g., `cd folder1/folder2`), or right-click the folder in the Explorer panel and select **"Open in Integrated Terminal."**
- Run `apio build`. This will generate or overwrite the programming file `hardware.bin`, ready for flashing onto your FPGA board. Download this file and follow the below instructions to get it onto your FPGA.

### FPGA Flashing – Linux

1. Install icestorm tools (includes `iceprog`) on your machine. For example:
   ```
   sudo apt update && sudo apt upgrade -y && sudo apt install fpga-icestorm -y
   ```
   If this doesn’t work, follow the official guide: https://prjicestorm.readthedocs.io/en/latest/overview.html#where-are-the-tools-how-to-install
2. Verify the FTDI chip is detected with:
   ```
   lsusb
   ```
3. Navigate to the directory containing `hardware.bin`, then run:
   ```
   sudo iceprog hardware.bin
   ```
4. Done!

### FPGA Flashing – Windows (via WSL)

#### Installation (Admin Access Required)

1. Install and configure WSL (Ubuntu 24.04.1 LTS is recommended).
2. In the Ubuntu terminal:
   ```
   sudo apt update && sudo apt upgrade -y && sudo apt install fpga-icestorm -y
   ```
   If that fails, follow this guide: https://prjicestorm.readthedocs.io/en/latest/overview.html#where-are-the-tools-how-to-install
3. Verify installation in WSL:
   ```
   iceprog --help
   ```
4. Install `usbipd-win` to allow WSL to connect to USB devices. In powershell (opened as admin):
   ```
   winget install --interactive --exact dorssel.usbipd-win
   ```
5. After installing, verify in powershell with:
   ```
   usbipd list
   ```
   Learn more: https://learn.microsoft.com/en-us/windows/wsl/connect-usb

#### 🔌 Using a Board for the First Time (Admin Access Required)

1. Open PowerShell as administrator:
   ```
   usbipd list
   ```
   Note the BUSID of the FTDI device.
2. Bind it to WSL:
   ```
   usbipd bind --force --busid <BUSID>
   ```

#### Flashing the FPGA (No Admin Access Needed)

1. Open PowerShell and run:
   ```
   usbipd list
   ```
   Confirm the FTDI device is **shared**. If not, see the previous section.
2. Attach it to WSL:
   ```
   usbipd attach --wsl --busid <BUSID>
   ```
3. In your WSL terminal, verify:
   ```
   lsusb
   ```
4. Navigate to the folder with `hardware.bin`, then flash:
   ```
   sudo iceprog hardware.bin
   ```
5. All done!
