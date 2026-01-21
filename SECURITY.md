# Security Policy

## 🔒 Security Overview

Gravity Engine is an educational physics simulation project. While security is not a critical concern for this type of application (it's not a web service, doesn't handle user credentials, or process sensitive data), we still take reasonable precautions to ensure the software is safe to use.

---

## 📋 Table of Contents

- [Supported Versions](#-supported-versions)
- [Known Security Considerations](#-known-security-considerations)
- [Reporting a Vulnerability](#-reporting-a-vulnerability)
- [Security Best Practices](#-security-best-practices)
- [Build Security](#-build-security)
- [Dependencies](#-dependencies)
- [Safe Usage Guidelines](#-safe-usage-guidelines)

---

## 🛡️ Supported Versions

We provide security updates for the following versions:

| Version | Supported          | Status |
| ------- | ------------------ | ------ |
| 1.x.x   | ✅ Yes             | Active development |
| 0.x.x   | ⚠️ Limited support | Bug fixes only |
| < 0.1   | ❌ No              | Deprecated |

**Current stable version**: Check [releases](https://github.com/NilsDontot/GravityEngine/releases)

---

## ⚠️ Known Security Considerations

### 1. Code Execution

**Nature**: The application executes Python code locally.

**Risk Level**: 🟡 Low (single-user desktop application)

**Mitigation**:
- No remote code execution
- No network access (except for optional music streaming in future versions)
- Runs with user-level permissions (no admin/root required)
- All code is open-source and auditable

### 2. File System Access

**Nature**: The application reads from the local file system.

**Risk Level**: 🟢 Very Low

**What it accesses**:
- `assets/font.ttf` - UI font (read-only)
- `assets/icon.ico` - Application icon (read-only)
- `assets/musics/*.mp3` - Background music (read-only, future feature)

**What it does NOT access**:
- User documents
- System files
- Network resources
- Webcam/microphone
- Other applications' data

### 3. Third-Party Dependencies

**Nature**: Uses external libraries (Pygame).

**Risk Level**: 🟢 Very Low

**Current dependencies**:
- `pygame` - Well-established, reputable library
- No other external dependencies

**Mitigation**:
- We use stable, widely-adopted versions
- Dependencies are minimal
- Regular updates when security patches are available

### 4. Executable Distribution

**Nature**: Pre-built Windows executables in `dist/`.

**Risk Level**: 🟡 Low to Medium (if downloaded from untrusted sources)

**Mitigation**:
- ✅ Always download from official [GitHub Releases](https://github.com/NilsDontot/GravityEngine/releases)
- ✅ Verify source code is identical to published version
- ✅ Build from source if concerned (see [README.md](README.md))
- ❌ Never download executables from third-party sites

### 5. User Input

**Nature**: Accepts mouse and keyboard input.

**Risk Level**: 🟢 Very Low

**Validation**:
- All inputs are validated and sanitized
- No SQL injection risk (no database)
- No command injection risk (no shell commands)
- No buffer overflow risk (Python memory management)

---

## 🚨 Reporting a Vulnerability

### When to Report

Please report security vulnerabilities if you discover:

- **Critical**: Remote code execution, privilege escalation, data exfiltration
- **High**: Local code execution, unauthorized file access beyond assets/
- **Medium**: Crash/DoS vulnerabilities, dependency vulnerabilities
- **Low**: UI issues that could be misleading

### How to Report

**For security issues, please DO NOT open a public issue.**

Instead, please email: **[nils.dontot.pro@gmail.com](mailto:nils.dontot.pro@gmail.com)**

**Subject**: `[SECURITY] Gravity Engine - Brief Description`

**Include**:
1. **Description** of the vulnerability
2. **Steps to reproduce** the issue
3. **Potential impact** (who/what is affected)
4. **Suggested fix** (if you have one)
5. **Your contact information** (for follow-up)

**Optional**:
- Proof of concept code (if safe to share)
- Screenshots or videos
- Environment details (OS, Python version, etc.)

### What to Expect

1. **Acknowledgment**: Within 48 hours
2. **Initial assessment**: Within 7 days
3. **Regular updates**: Every 7-14 days until resolved
4. **Fix timeline**:
   - Critical: 1-7 days
   - High: 7-30 days
   - Medium: 30-90 days
   - Low: Next planned release

### Disclosure Policy

- **Coordinated disclosure**: We prefer to fix issues before public disclosure
- **Credit**: Security researchers will be credited (unless they prefer anonymity)
- **Timeframe**: 90 days from report to public disclosure (negotiable)

---

## 🔐 Security Best Practices

### For Users

#### When Running from Source
```bash
# ✅ GOOD - Use virtual environment
python -m venv venv
venv\Scripts\activate
pip install pygame
python src/gravity_engine.py

# ❌ BAD - Global pip install (pollutes system Python)
pip install pygame  # Don't do this
```

#### When Using Executables
```bash
# ✅ GOOD - Download from official releases
https://github.com/NilsDontot/GravityEngine/releases

# ❌ BAD - Third-party download sites
❌ Do NOT download from random websites
❌ Do NOT run executables from unknown sources
❌ Do NOT disable antivirus to run the program
```

#### General Safety

- ✅ Keep Python and dependencies updated
- ✅ Run with standard user permissions (not admin)
- ✅ Review code before running (it's open source!)
- ✅ Use antivirus software
- ❌ Don't modify system files
- ❌ Don't run as administrator/root

### For Developers

#### Code Security
```python
# ✅ GOOD - Input validation
def create_circle(x, y, radius, mass):
    if not isinstance(x, (int, float)):
        raise ValueError("Invalid x coordinate")
    if radius < 0:
        raise ValueError("Radius must be positive")
    # ... create circle

# ❌ BAD - No validation
def create_circle(x, y, radius, mass):
    self.x = x  # Could be anything!
```

#### File Operations
```python
# ✅ GOOD - Safe path handling
import os

def load_asset(filename):
    asset_dir = os.path.join(os.path.dirname(__file__), 'assets')
    safe_path = os.path.abspath(os.path.join(asset_dir, filename))
    
    # Prevent directory traversal
    if not safe_path.startswith(asset_dir):
        raise ValueError("Invalid file path")
    
    return safe_path

# ❌ BAD - Unsafe path construction
def load_asset(filename):
    return f"assets/{filename}"  # Vulnerable to ../../../etc/passwd
```

#### Dependency Management
```python
# ✅ GOOD - Specific versions
# requirements.txt
pygame==2.5.0

# ❌ BAD - Unversioned dependencies
# requirements.txt
pygame  # Could pull vulnerable version
```

---

## 🏗️ Build Security

### Official Builds

**All official releases are:**
- Built from tagged commits on the main branch
- Built using the automated build scripts in `builders/`
- Scanned for common vulnerabilities
- Tested on clean Windows environments

### Building from Source

**To ensure you're running trusted code:**
```bash
# 1. Clone from official repository
git clone https://github.com/NilsDontot/GravityEngine.git

# 2. Verify you're on a tagged release (optional)
git checkout v1.0.0

# 3. Review the code
# Read src/gravity_engine.py before running

# 4. Build yourself
make.bat  # Choose option [2] for release build
```

### Verifying Executables

**Future**: We plan to provide checksums (SHA-256) for official releases.
```bash
# When available:
# Download GravityEngine.exe and GravityEngine.exe.sha256

# Verify (Windows PowerShell):
Get-FileHash GravityEngine.exe -Algorithm SHA256
# Compare output with GravityEngine.exe.sha256
```

---

## 📦 Dependencies

### Current Dependencies

| Package | Version | Purpose | Security Status |
|---------|---------|---------|-----------------|
| pygame | 2.5.0+ | Graphics and input | ✅ Actively maintained |
| Python | 3.8+ | Runtime | ✅ Regularly updated |

### Dependency Monitoring

We monitor dependencies for:
- Known CVEs (Common Vulnerabilities and Exposures)
- Security advisories
- End-of-life announcements

### Updating Dependencies
```bash
# Check for updates
pip list --outdated

# Update safely
pip install --upgrade pygame

# Or use requirements.txt (when available)
pip install -r requirements.txt --upgrade
```

---

## 🛡️ Safe Usage Guidelines

### What Gravity Engine Does

✅ **Safe operations**:
- Renders graphics using Pygame
- Responds to mouse/keyboard input
- Performs physics calculations
- Reads font and icon files from assets/
- Plays music files (future feature)

### What Gravity Engine Does NOT Do

❌ **We never**:
- Access the internet
- Write to system directories
- Modify registry (Windows)
- Access personal files
- Use webcam/microphone
- Send telemetry/analytics
- Install drivers or services
- Require admin privileges
- Execute shell commands
- Open network sockets

### Permissions Required

**Minimal permissions needed**:
- ✅ Read access to application directory
- ✅ Read access to assets/ folder
- ✅ Graphics rendering (Pygame)
- ✅ Audio output (optional, for music)

**Never requires**:
- ❌ Administrator/root access
- ❌ Firewall exceptions
- ❌ Network access
- ❌ Write access to system folders
- ❌ Access to other applications

### Red Flags

**🚩 If the application ever asks for**:
- Administrator/root password
- Firewall access
- Antivirus disable
- Write access to system folders
- Access to documents/downloads

Then something is wrong! **Please report it immediately.**

---

## 🔍 Vulnerability Disclosure Examples

### Example 1: Critical Vulnerability
```markdown
Subject: [SECURITY] Gravity Engine - Arbitrary File Read

Description:
I discovered that the font loading function doesn't validate paths,
allowing an attacker to read arbitrary files using path traversal.

Steps to Reproduce:
1. Modify config to load font: "../../../etc/passwd"
2. Application reads and potentially displays system files

Impact:
- Confidential file disclosure
- Affects all platforms

Suggested Fix:
Implement path validation in resource_path() function
```

### Example 2: Medium Vulnerability
```markdown
Subject: [SECURITY] Gravity Engine - DoS via Infinite Bodies

Description:
Creating too many bodies (>100,000) causes the application to freeze
indefinitely with no way to recover except force-quit.

Steps to Reproduce:
1. Press 'P' repeatedly to generate bodies
2. After ~100,000 bodies, app becomes unresponsive

Impact:
- Denial of service (local)
- No data loss
- Easy to trigger accidentally

Suggested Fix:
Add maximum body count limit (e.g., 10,000)
```

---

## 🎯 Security Roadmap

### Planned Security Improvements

**Q1 2026**:
- [ ] Add SHA-256 checksums for releases
- [ ] Implement input validation across all user inputs
- [ ] Add file path sanitization
- [ ] Document all file system access

**Q2 2026**:
- [ ] Automated dependency vulnerability scanning
- [ ] Code signing for Windows executables
- [ ] Security audit of physics calculations (prevent overflow/underflow)

**Q3 2026**:
- [ ] Penetration testing
- [ ] Formal security review
- [ ] Bug bounty program (if project grows)

---

## 📚 Additional Resources

### Security Best Practices
- [OWASP Secure Coding Practices](https://owasp.org/www-project-secure-coding-practices-quick-reference-guide/)
- [Python Security Best Practices](https://python.readthedocs.io/en/stable/library/security_warnings.html)
- [Pygame Security Considerations](https://www.pygame.org/wiki/SecurityConsiderations)

### Vulnerability Databases
- [CVE Database](https://cve.mitre.org/)
- [NVD - National Vulnerability Database](https://nvd.nist.gov/)
- [PyPI Advisory Database](https://github.com/pypa/advisory-database)

### Reporting Platforms
- Direct email: [nils.dontot.pro@gmail.com](mailto:nils.dontot.pro@gmail.com)
- GitHub Security Advisory (for public disclosure after fix)

---

## ✅ Security Checklist

### Before Each Release

- [ ] All dependencies updated to latest secure versions
- [ ] No hardcoded credentials or secrets
- [ ] Input validation implemented
- [ ] File operations use safe paths
- [ ] No known vulnerabilities in code
- [ ] Executable scanned with antivirus
- [ ] SHA-256 checksum calculated
- [ ] Security section in release notes

### For Contributors

- [ ] Follow secure coding practices
- [ ] Validate all user inputs
- [ ] Use safe file operations
- [ ] No eval() or exec()
- [ ] No shell command execution
- [ ] Review dependencies for vulnerabilities
- [ ] Test for edge cases and overflow

---

## 🙏 Acknowledgments

We appreciate responsible security researchers who help keep Gravity Engine safe. If you report a valid security issue, you will be:

- **Credited** in release notes (unless you prefer anonymity)
- **Thanked** publicly on GitHub
- **Listed** in our security hall of fame (future)

**Hall of Security Researchers**:
- *Be the first to help secure Gravity Engine!* 🛡️

---

## 📞 Contact

**Security Team** (currently just me! 😊):
- **Email**: [nils.dontot.pro@gmail.com](mailto:nils.dontot.pro@gmail.com)
- **GitHub**: [@NilsDontot](https://github.com/NilsDontot)
- **Response time**: Usually within 48 hours (can take more time, I am in high school)

**For non-security issues**:
- Use [GitHub Issues](https://github.com/NilsDontot/GravityEngine/issues)

---

## 📄 License Note

This security policy is part of the Gravity Engine project, licensed under **CC BY-NC-SA 4.0**.

Security information may be shared freely to protect users, even in commercial contexts, as an exception to the non-commercial license.

---

**Remember**: Security is everyone's responsibility. If you see something, say something! 🔒

**Stay safe and keep coding!** ✨

---

*Last updated: January 21, 2026*  
*Maintained by Nils DONTOT*  
*Version: 1.0*
