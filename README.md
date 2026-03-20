🚗 Car Number Plate Recognition System (ANPR)

This project is my Year 3 implementation of an Automatic Number Plate Recognition (ANPR) system. It is based on the structured pipeline described in “Car Number Plate Extraction in Three Steps”, but fully implemented and tested by me using real-world data.

📌 Overview

This system captures live video from a webcam and automatically detects, processes, and recognizes vehicle license plates in real time.

It is designed to be lightweight and CPU-friendly, using classical computer vision techniques instead of heavy deep learning models.

⚙️ Pipeline

The system follows this pipeline:

Camera → Detection → Alignment → OCR → Validation → Temporal → Save

Explanation:

Detection → Locate the number plate in the frame

Alignment → Correct perspective and orientation

OCR → Extract text using Tesseract

Validation → Ensure the format is valid

Temporal → Confirm consistency across frames

Save → Store results in CSV

🛠️ Installation
Requirements:

Python 3.8+

Webcam

Setup:
# create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# install dependencies
pip install -r requirements.txt

# install tesseract OCR
sudo apt install tesseract-ocr
▶️ Usage
Run full system:
python src/main.py
Test individual modules:
python src/camera.py
python src/detect.py
python src/align.py
python src/ocr.py
python src/validate.py

Press q to exit the camera.

📁 Project Structure
src/
  camera.py       # webcam capture
  detect.py       # plate detection
  align.py        # perspective correction
  ocr.py          # text recognition
  validate.py     # format validation
  temporal.py     # multi-frame confirmation
  main.py         # main pipeline controller

data/
  plates.csv      # saved plate records

screenshots/
  # real test results captured during experiments
🔍 Implementation Details
🔹 Detection

Uses OpenCV contour detection

Filters shapes based on aspect ratio (2–8) to identify plate candidates

🔹 Alignment

Applies perspective transformation

Normalizes plate size to 450 × 140 pixels

🔹 OCR

Uses Tesseract OCR

Restricted to A–Z and 0–9 to improve accuracy

🔹 Validation

Uses pattern matching:

3 letters + 3 numbers + 1 letter
Example: RAD123A
🔹 Temporal Confirmation

Stores last 5 readings

Uses majority voting to improve reliability

🔹 Saving

Saves plate + timestamp to CSV

Prevents duplicates within 10 seconds

🧪 Testing

The system was tested on real vehicles in a parking environment.

Works best when:

Distance: 2–5 meters

Lighting: Good / daylight

Plate condition: Clean and visible

Camera angle: Nearly frontal

⚠️ Limitations

OCR confusion between similar characters (e.g., B ↔ 8, O ↔ 0)

Performance drops in low light conditions

Sensitive to extreme viewing angles

Requires moderate proximity to the vehicle

📦 Dependencies

opencv-python

pytesseract

numpy

pandas

📚 Reference

This project is inspired by the methodology described in:

“Car Number Plate Extraction in Three Steps” – Gabriel Baziramwabo
