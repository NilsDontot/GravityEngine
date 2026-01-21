# Gravity Engine

A real-time N-body gravitational simulation built with Python and Pygame.

**Created by [Nils DONTOT](https://github.com/Nitr0xis)**

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Pygame](https://img.shields.io/badge/pygame-2.0+-green.svg)](https://www.pygame.org/)
[![GitHub](https://img.shields.io/badge/GitHub-Nitr0xis-181717?logo=github)](https://github.com/Nitr0xis)

---

**Author:** Nils DONTOT  
**Repository:** [github.com/Nitr0xis/GravityEngine](https://github.com/Nitr0xis/GravityEngine)  
**Email:** [nils.dontot.pro@gmail.com](mailto:nils.dontot.pro@gmail.com)

---

## 📋 Table of Contents

- [Before We Begin](#-before-we-begin)
- [Overview](#-overview)
- [Features](#-features)
- [Installation](#-installation)
- [Project Structure](#-project-structure)
- [Building Executables](#-building-executables)
- [Controls](#-controls)
- [Configuration](#️-configuration)
- [Physics](#-physics)
- [Performance](#-performance)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)
- [Contact](#-contact)

## 🪶 Before We Begin

Hello, I am 15 years old and I am passionate about programming and physics. That is why I decided in mid-2025 to create a gravity simulator with Python. Here is the result of my work. Feel free to submit pull requests if you identify potential improvements or optimization opportunities. I am constantly trying to improve it, and I hope you like it.

Every previous change is available in [ROADMAP.md](ROADMAP.md).

## 🌌 Overview

Gravity Engine is an interactive physics simulation that allows you to create and observe celestial bodies interacting under Newtonian gravity. Watch bodies orbit, collide, and merge in real-time with adjustable parameters and visualization options.

The simulation features accurate Newtonian physics with momentum conservation, customizable gravitational constants, and multiple visualization modes. Whether you want to recreate a solar system, observe chaotic three-body problems, or simply experiment with gravitational interactions, Gravity Engine provides an intuitive interface for exploration.

**Developed by Nils DONTOT** - [GitHub Profile](https://github.com/Nitr0xis)

![Gravity Engine Demo](assets/demo.gif) *(A demo gif will soon be added)*

## ✨ Features

### Current Features
- ✅ **Real-time N-body simulation** - Accurate gravitational calculations for multiple bodies
- ✅ **Interactive body creation** - Click and hold to create bodies of any size
- ✅ **Momentum conservation** - Bodies merge realistically, conserving mass and momentum
- ✅ **Vector visualization** - Display velocity and force vectors in real-time
- ✅ **Detailed analytics** - Track mass, velocity, energy, age, and more for each body
- ✅ **Pause/resume** - Freeze time to analyze your simulation
- ✅ **Random velocity mode** - Add chaos with randomized initial velocities
- ✅ **Reversed gravity** - Experiment with repulsive gravity
- ✅ **FPS correction** - Consistent physics regardless of frame rate
- ✅ **Fullscreen support** - Automatic native resolution detection
- ✅ **Random environments** - Generate preset configurations instantly
- ✅ **Standalone executable** - Build distributable .exe files (Windows)

### Planned Features
See [ROADMAP.md](ROADMAP.md) for upcoming features and development timeline.

## 🚀 Installation

### Option 1: Use Pre-built Executable (Easiest)

**For Windows users:**

1. Download `GravityEngine.exe` from the [Releases](https://github.com/Nitr0xis/GravityEngine/releases) page
2. Double-click to run - no installation needed!

> 💡 **Note**: The executable is self-contained and includes all dependencies. No Python installation required.

### Option 2: Run from Source (For Developers)

**Prerequisites:**
- Python 3.8 or higher
- pip (Python package manager)

**Quick Start:**

1. **Clone the repository**
```bash
   git clone https://github.com/Nitr0xis/GravityEngine.git
   cd GravityEngine
```

2. **Install dependencies**
   
   The program will automatically install required dependencies on first run, or install manually:
```bash
   pip install pygame
```

3. **Run the simulation**
```bash
   python src/gravity_engine.py
```

### Option 3: Manual Installation with Virtual Environment
```bash
# Create virtual environment (recommended)
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install pygame

# Run the program
python src/gravity_engine.py
```

## 📁 Project Structure
```
GravityEngine/
│
├── dist/                           # 📦 Built executables (after building)
│   └── GravityEngine.exe          # Standalone executable (Windows)
│
├── src/
│   └── gravity_engine.py          # 🎯 Main program - run this to start
│
├── assets/
│   ├── font.ttf                   # ✅ UI font (required)
│   └── icon.ico                   # 🎨 Executable icon
│
├── builders/                       # 🔨 Build scripts
│   ├── build.bat                  # Development build (with console)
│   ├── build_release.bat          # Release build (no console)
│   └── clean.bat                  # Clean build files
│
├── make.bat                        # 📋 Interactive build menu
├── README.md                       # 📖 This file
├── ROADMAP.md                      # 🗺️ Development roadmap
├── LICENSE                         # ⚖️ License terms (CC BY-NC-SA 4.0)
├── .gitignore                      # 🚫 Git ignore rules
└── .gitattributes                  # 📝 Git attributes
```

### Important Files

| File | Description | Required |
|------|-------------|----------|
| `dist/GravityEngine.exe` | Standalone executable (post-build) | 📦 Distributable |
| `src/gravity_engine.py` | Main Python source code | ✅ Required for dev |
| `assets/font.ttf` | UI font file | ✅ Required |
| `assets/icon.ico` | Executable icon | 🎨 Recommended |
| `builders/*.bat` | Build automation scripts | 🔨 For building |
| `make.bat` | Build system menu | 📋 Build interface |
| `README.md` | Documentation | 📖 Recommended |
| `ROADMAP.md` | Development timeline | 🗺️ Recommended |
| `LICENSE` | License information | ⚖️ Legal |

### The `dist/` Folder

The `dist/` folder contains built executables created by PyInstaller:

- **Created by**: Running `build.bat` or `build_release.bat`
- **Contents**: Self-contained `.exe` files with all dependencies embedded
- **Distribution**: Share `GravityEngine.exe` with users who don't have Python
- **Size**: Approximately 15-30 MB (includes Python runtime, Pygame, and assets)
- **Ignored by Git**: Not tracked in version control (too large)

> 💡 **Tip**: Users who download your executable don't need Python, Pygame, or any dependencies installed!

## 🔨 Building Executables

### Using the Build Menu (Recommended)

Simply double-click `make.bat` to access the interactive build menu:
```
 ================================================
   Gravity Engine - Build System
   by Nils DONTOT
 ================================================

 [1] Build Development      (with console)
 [2] Build Release          (ready to distribute)
 [3] Clean                  (remove build files)
 [4] Clean + Build Release  (fresh release build)
 [5] Run                    (without building)
 [6] Test Executable        (run last built .exe)
 [7] Open dist folder       (view executables)
 [8] Help
 [0] Exit

 ================================================
```

### Build Options Explained

| Option | Purpose | Output | Use Case |
|--------|---------|--------|----------|
| **[1] Development** | Quick build with debug console | `GravityEngine_Dev.exe` | Testing and debugging |
| **[2] Release** | Optimized build, no console | `GravityEngine.exe` | Distribution to users |
| **[3] Clean** | Remove all build artifacts | - | Fresh start |
| **[4] Clean + Build** | Clean, then release build | `GravityEngine.exe` | Final distribution |
| **[5] Run** | Launch Python source directly | - | Quick testing |
| **[6] Test Executable** | Run last built .exe | - | Verify build works |
| **[7] Open dist/** | Open folder in Explorer | - | View executables |
| **[8] Help** | Show detailed help | - | Learn about options |

### Manual Building

**Development Build (with console for debugging):**
```bash
builders\build.bat
```

**Release Build (no console, for distribution):**
```bash
builders\build_release.bat
```

**Clean build files:**
```bash
builders\clean.bat
```

### Build Requirements

- **PyInstaller** - Automatically installed on first build
- **All assets** - Must be present in `assets/` folder
- **Windows** - Build scripts are Windows batch files (.bat)

> 💡 **Note**: On first build, PyInstaller will be automatically installed if not present.

### Distributing Your Build

After building, share **only** the `dist/GravityEngine.exe` file:

1. Build release version: `make.bat` → Option `[2]`
2. Find executable in `dist/GravityEngine.exe`
3. Share this single file - it contains everything!
4. Users double-click to run - no installation needed

## 🎮 Controls

### Mouse Controls
- **Left Click** - Create a new body (hold to increase size)
- **Right Click** - Create a new body (hold to increase size)
- **Mouse Wheel** - Create smallest possible bodies *(future feature)*
- **Click on Body** - Select/deselect a body

### Keyboard Controls
| Key | Action |
|-----|--------|
| `Space` | Pause/unpause simulation |
| `V` | Toggle velocity vectors display |
| `R` | Toggle random velocity mode |
| `G` | Toggle reversed gravity |
| `P` | Generate random environment (20 bodies) |
| `Delete` | Delete selected body |
| `Escape` | Exit program |

### Tips

- **Hold mouse button** to create larger bodies
- **Click quickly** to create small bodies
- **Select a body** to view detailed information
- **Use P key** to quickly populate the simulation
- **Pause with Space** to analyze the simulation state
- **Toggle vectors (V)** to visualize motion and forces

## ⚙️ Configuration

You can modify simulation parameters in the `Engine.__init__()` method within `src/gravity_engine.py`. Parameters are organized into logical sections:

### Display Settings
```python
self.FULLSCREEN = True              # Enable fullscreen mode
self.screen_mode = "dark"           # Color scheme: "dark" or "light"
```

### UI Settings
```python
self.txt_size = 30                  # Font size for UI text
self.txt_gap = 15                   # Spacing between text lines
self.info_y = 20                    # Y position for info display
```

### Physics Settings
```python
self.G = 6.6743e-11                 # Gravitational constant (m³ kg⁻¹ s⁻²)
self.gravity = self.G               # Active gravitational constant
self.fusions = True                 # Enable/disable body fusion on collision
```

### Simulation Settings
```python
self.FPS = 120                      # Target frames per second
self.speed = 100_000_000            # Time acceleration factor
self.growing_speed = 0.5            # Body growth rate when creating
```

### Visualization Settings
```python
self.vectors_printed = False        # Show velocity vectors by default
self.strength_vectors = True        # Show force vectors
self.cardinal_vectors = False       # Show X/Y velocity components
self.vectors_in_front = True        # Draw vectors on top of bodies
self.vector_length = 1              # Vector display scale multiplier
```

### Random Generation Settings
```python
self.random_mode = False            # Random initial velocities on creation
self.random_field = 1e-17           # Random velocity energy in kJ
self.random_environment_number = 20 # Bodies created with 'P' key
```

### Audio Settings *(Feature in Development)*
```python
self.music = False                  # Enable/disable background music
self.music_volume = 1               # Music volume (0.0 to 1.0)
```

### Quick Configuration Examples

#### Slower, More Visible Simulation
```python
self.speed = 1_000_000              # Reduce time acceleration
self.vectors_printed = True         # Show vectors by default
self.vector_length = 2              # Make vectors longer
```

#### High-Performance Mode
```python
self.FPS = 60                       # Lower FPS for better performance
self.vectors_printed = False        # Disable vectors
self.strength_vectors = False       # Disable force vectors
```

#### Chaotic System
```python
self.random_mode = True             # Random initial velocities
self.random_field = 1e-16           # Higher random energy
self.reversed_gravity = True        # Reverse gravity direction
```

#### Solar System-like Setup
```python
self.speed = 10_000_000             # Moderate time acceleration
self.fusions = False                # Prevent planets from merging
self.random_mode = False            # Controlled initial conditions
```

### Advanced Configuration

For more advanced modifications, you can edit:

- **Body creation** → `Circle.__init__()`
- **Force calculations** → `Circle.attract()`
- **Collision behavior** → `Circle.fusion()`
- **Keyboard mappings** → `Engine.run()` → `KEY_MAP`

### Configuration File *(Future Feature)*

> 📋 **Coming Q2 2026**: External configuration file support (JSON/YAML). See [ROADMAP.md](ROADMAP.md).

## 🔬 Physics

### Gravitational Force

The simulation implements Newton's law of universal gravitation:
```
F = G × (m₁ × m₂) / r²
```

**Where:**
- `F` = gravitational force (Newtons)
- `G` = gravitational constant (6.6743 × 10⁻¹¹ m³ kg⁻¹ s⁻²)
- `m₁, m₂` = masses of the two bodies (kilograms)
- `r` = distance between body centers (meters)

### Momentum Conservation

All interactions conserve momentum using:
```
p_total = m₁v₁ + m₂v₂ = constant
```

This ensures physically accurate collisions and mergers.

### Body Fusion

When two bodies collide (distance < sum of radii), they merge while conserving:

- **Mass**: `m_new = m₁ + m₂`
- **Momentum**: `p_new = p₁ + p₂`
- **Position**: Mass-weighted center: `x_new = (m₁x₁ + m₂x₂) / m_total`
- **Velocity**: From momentum: `v_new = p_new / m_new`

The new radius is calculated as:
```
r_new = ∛(m_new)
```

### Time Acceleration

The simulation includes a configurable time acceleration factor:
- Real-time physics calculations
- FPS-independent updates
- Adjustable speed multiplier (default: 100,000,000×)

### Units

| Property | Unit | Symbol |
|----------|------|--------|
| Mass | Tonnes | t |
| Distance | Meters | m |
| Time | Seconds | s |
| Force | Newtons | N |
| Energy | Joules | J |
| Velocity | Meters/second | m/s |

> ⚠️ **Note**: Unit system revision in progress. See [ROADMAP.md](ROADMAP.md).

## 📊 Performance

### Current Performance

- **Algorithm**: O(n²) brute-force gravitational calculations
- **Optimal range**: Up to ~100 bodies at 60 FPS
- **FPS independence**: Physics accuracy maintained regardless of frame rate
- **Memory**: ~50-100 MB typical usage

### Performance Tips

1. **Reduce body count** - Fewer bodies = faster simulation
2. **Disable vectors** - Turn off visualization for better performance
3. **Lower FPS** - 60 FPS is often sufficient
4. **Windowed mode** - Slightly faster than fullscreen on some systems

### Planned Optimizations

See [ROADMAP.md](ROADMAP.md) for upcoming performance improvements:

- **QuadTree/Barnes-Hut** - Reduce complexity to O(n log n)
- **GPU acceleration** - CUDA support for thousands of bodies
- **Multi-threading** - Parallel force calculations
- **Spatial partitioning** - Efficient collision detection

## 📈 Roadmap

See [ROADMAP.md](ROADMAP.md) for detailed development plans and timelines.
Previous features and completed milestones are documented in the file.

### Q1 2026 Status

| Priority | Feature | Status |
|----------|---------|--------|
| 1 | Coherent physical units | ⏳ In Progress |
| 2 | Relative display system | ⏳ In Progress |
| 3 | Partial mass transfer | 📋 Planned |
| 4 | Optimized calculations | 📋 Planned |

### Next Milestones

- **February 2026**: Unit system overhaul, screen-relative display
- **March 2026**: Partial collisions, QuadTree optimization
- **Q2 2026**: Save/load system, UI improvements, configuration files

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### Ways to Contribute

1. **Report bugs** - Open an issue with detailed description
2. **Suggest features** - Share your ideas in issues
3. **Submit pull requests** - Fix bugs or add features
4. **Improve documentation** - Help make the README clearer
5. **Share your simulations** - Show what you've created!

### Development Workflow
```bash
# 1. Fork and clone your fork
git clone https://github.com/YOUR_USERNAME/GravityEngine.git
cd GravityEngine

# 2. Create a feature branch
git checkout -b feature/your-feature-name

# 3. Make your changes
# Edit src/gravity_engine.py or other files

# 4. Test your changes
python src/gravity_engine.py

# 5. Commit with descriptive message
git add .
git commit -m "Add: detailed description of your changes"

# 6. Push and create pull request
git push origin feature/your-feature-name
```

### Code Style Guidelines

- **Follow PEP 8** - Python style guide
- **Add docstrings** - Document classes and methods
- **Comment physics** - Explain complex calculations
- **Keep functions small** - Single responsibility principle
- **Test thoroughly** - Verify physics accuracy

### Areas Needing Help

- 🐛 Bug fixes and stability improvements
- ⚡ Performance optimizations
- 📊 New physics features
- 🎨 UI/UX improvements
- 📖 Documentation and tutorials
- 🌍 Internationalization

## 📝 License

This project is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

**Copyright © 2026 Nils DONTOT**

### You are free to:

- ✅ **Share** - Copy and redistribute the material in any medium or format
- ✅ **Adapt** - Remix, transform, and build upon the material

### Under the following terms:

- 📛 **Attribution** - Give appropriate credit to **Nils DONTOT**, provide a link to the license, and indicate if changes were made
- 🚫 **NonCommercial** - You may not use the material for commercial purposes
- 🔄 **ShareAlike** - If you remix, transform, or build upon the material, you must distribute your contributions under the same license

### What this means:

- ✅ Use for learning and education
- ✅ Modify for personal projects
- ✅ Share with attribution
- ❌ Sell or commercialize
- ❌ Use in paid products/services

See [LICENSE](LICENSE) for the complete legal text.

## 📧 Contact

**Nils DONTOT**

- 📧 **Email**: [nils.dontot.pro@gmail.com](mailto:nils.dontot.pro@gmail.com)
- 🐙 **GitHub**: [@Nitr0xis](https://github.com/Nitr0xis)
- 🔗 **Repository**: [github.com/Nitr0xis/GravityEngine](https://github.com/Nitr0xis/GravityEngine)
- 🌐 **Issues**: [Report bugs or suggest features](https://github.com/Nitr0xis/GravityEngine/issues)

### Get in Touch

- **Questions?** Open an issue or send an email
- **Ideas?** Share them in the issues section
- **Collaboration?** Pull requests are welcome!

## 🙏 Acknowledgments

- **Pygame** - Amazing game development library ([pygame.org](https://www.pygame.org/))
- **PyInstaller** - Executable building tool
- **Newton** - For the physics (obviously! 😄)
- **You** - For checking out this project!

### Inspiration

This project was inspired by:
- Classical N-body simulations
- Space flight simulators
- Educational physics demonstrations
- The beauty of orbital mechanics

## 📸 Screenshots

*(Screenshots will be added soon to showcase features)*

### Main Simulation
![Main View](assets/screenshot1.png)
*The main simulation window showing multiple gravitating bodies*

### Vector Visualization
![Vectors](assets/screenshot2.png)
*Velocity and force vectors displayed in real-time*

### Body Information
![Info Panel](assets/screenshot3.png)
*Detailed information about a selected body*

### Chaotic System
![Chaos](assets/screenshot4.png)
*Multiple bodies in chaotic gravitational dance*

---

## 🎓 Educational Use

Gravity Engine is perfect for:

- **Physics education** - Demonstrate gravitational concepts
- **Programming learning** - Study game physics and Pygame
- **Scientific visualization** - Explore N-body problems
- **Entertainment** - Create beautiful orbital patterns

---

## 🎯 Quick Start Guide

### First Launch

1. **Run** `src/gravity_engine.py` or `dist/GravityEngine.exe`
2. **Click and hold** anywhere to create a body
3. **Release** to place it
4. **Press P** to generate a random system
5. **Click a body** to see its information
6. **Press V** to see velocity vectors
7. **Press Space** to pause and analyze

### Creating Interesting Systems

**Binary System:**
1. Create two medium-sized bodies
2. Place them close together
3. Watch them orbit!

**Three-Body Problem:**
1. Create three bodies of similar size
2. Arrange in a triangle
3. Enable random mode (R)
4. Observe chaotic motion

**Solar System:**
1. Create one large central body
2. Add smaller bodies around it
3. Give them tangential velocities
4. Disable fusion (edit config)

---

**⭐ Star this repository if you find it interesting!**

**Made with ❤️ and ☕ by [Nils DONTOT](https://github.com/Nitr0xis)**

*Last updated: January 21, 2026*
