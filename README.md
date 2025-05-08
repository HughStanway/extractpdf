# extractpdf

`extractpdf` is a lightweight command-line tool that leverages [OCRmyPDF](https://github.com/ocrmypdf/ocrmypdf) to convert scanned or image-only PDFs into searchable, PDF/A‑2B–compliant documents and produce a plain-text sidecar file. It preserves the original layout and requires no elevated privileges when installed with the provided self-extracting installer.

---

## 🛠️ Features

* **Preserve Formatting**: Your output PDF looks exactly like the original scan, with an invisible, selectable text layer.
* **Searchable PDF/A‑2B**: Automatically converts to the archival PDF/A‑2B standard.
* **Sidecar Text File**: Extracted text dumped into a `.txt` file for easy processing.
* **User-Local Install**: No `sudo` required—installs into `~/.local/bin` or `~/bin`.

---

## 🚀 Quick Start (Using the Self-Extracting Installer)

1. **Download** the latest release asset `v1.1.zip` from the [Releases page](https://github.com/HughStanway/extractpdf/releases/tag/v1.1) and unzip the file.
2. **Make executable**:

   ```bash
   chmod +x extract_pdf_installer.run
   ```
3. **Run the installer**:

   ```bash
   ./extract_pdf_installer.run
   ```

   This copies the `extractpdf` executable into `~/.local/bin` (fallback `~/bin`).
4. **Verify** that your `PATH` includes `~/.local/bin` or `~/bin`, then use:

   ```bash
   extractpdf input.pdf [output.txt]
   ```

   * If `[output.txt]` is omitted, text is saved to `output.txt` in the current directory.

---

## ⚙️ Prerequisites

* **Operating System**: macOS or Linux
* **Python 3** (with `pip3`)
* **Tesseract OCR**:

  * macOS: `brew install tesseract`
  * Ubuntu/Debian: `sudo apt-get install tesseract-ocr`
* **OCRmyPDF**:

  ```bash
  pip3 install ocrmypdf
  ```

*For building the self-extracting archive:*

* **Makeself**:

  * macOS: `brew install makeself`
  * Ubuntu/Debian: `sudo apt-get install makeself`

---

## 🏗️ Building from Source

1. **Clone the repository**:

   ```bash
   git clone https://github.com/HughStanway/extractpdf.git
   cd extractpdf
   ```
2. **Make scripts executable**:

   ```bash
   chmod +x extract_pdf.sh install.sh
   ```
3. **Create the installer**:

   ```bash
   makeself --notemp . \
     extract_pdf_installer.run \
     "extractpdf Installer v1.0" \
     ./install.sh
   ```
4. **Publish**: Tag your release (`git tag v1.0`), push, then upload `extract_pdf_installer.run` to GitHub Releases.

---

## 📁 Repository Layout

```plaintext
.
├── extractpdf.sh    # OCRmyPDF wrapper script
├── install.sh        # User-local installer
└── README.md         # Project documentation
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Please open an issue or submit a pull request on GitHub.

---

## 📄 License

This project is licensed under the MIT License.

