#!/bin/bash

# Setup script for Car Number Plate Extraction System
# This script automates the installation process

echo "=========================================="
echo "Car Number Plate Extraction System Setup"
echo "=========================================="
echo ""

# Check Python version
echo "Checking Python version..."
python3 --version

if [ $? -ne 0 ]; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✅ Python 3 found"
echo ""

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv .venv

if [ $? -ne 0 ]; then
    echo "❌ Failed to create virtual environment"
    exit 1
fi

echo "✅ Virtual environment created"
echo ""

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
python -m pip install --upgrade pip setuptools wheel

# Install Python dependencies
echo ""
echo "Installing Python dependencies..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "❌ Failed to install Python dependencies"
    exit 1
fi

echo "✅ Python dependencies installed"
echo ""

# Check for Tesseract
echo "Checking for Tesseract OCR..."
tesseract --version > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "⚠️  Tesseract OCR is not installed"
    echo ""
    echo "Please install Tesseract manually:"
    echo ""
    echo "Ubuntu/Debian:"
    echo "  sudo apt update"
    echo "  sudo apt install tesseract-ocr"
    echo ""
    echo "macOS:"
    echo "  brew install tesseract"
    echo ""
else
    echo "✅ Tesseract OCR found"
    tesseract --version
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Activate virtual environment: source .venv/bin/activate"
echo "2. Test camera: python src/camera.py"
echo "3. Run main system: python src/main.py"
echo ""
echo "For testing on real vehicles, see TESTING_GUIDE.md"
echo ""
