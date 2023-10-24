# Bash Script: Audio File Conversion Script
This Bash script is designed to convert audio files in various formats to MP3. It removes spaces from filenames, ensuring compatibility with conversion and future use. It is particularly useful for batch processing multiple audio files.

## System Requirements
Before running this script, ensure the following prerequisites are met:

macOS (macOS-specific installation instructions are provided)
Homebrew for package management
FFmpeg for audio file conversion

# macOS Installation
If you are using macOS, make sure to set up the required tools by following these steps:

## Install Xcode Command Line Tools:

xcode-select --install
Install Homebrew:

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Verify Homebrew installation:
brew -v

# Update Homebrew:
brew update

# Upgrade Homebrew packages:
brew upgrade

# Install FFmpeg:
brew install ffmpeg

Usage
Set the input, output, and processed directories as required:

input="/mnt/in/"
output="/mnt/out/"
processed="/mnt/processed/"
Place your audio files in the input directory specified above.

# Run the script using the Bash interpreter:

bash audio_conversion_script.sh

The script will convert the supported audio file formats to MP3.

Converted MP3 files will be moved to the output directory, and the original files will be moved to the processed directory.

The script logs the start and end times of the conversion process in a time log file.

## Supported Audio Formats
The script supports the following audio file formats for conversion to MP3:

MXF
MOV
MPG
FLAC
WAV
AIFF
MPEG

# Notes
The script removes spaces from filenames and replaces them with underscores to ensure compatibility.
Special characters in filenames are also replaced with underscores.
The script is set up for macOS; you may need to adapt it for other operating systems.

#Author
This script was created by Darren Lavery
For any questions or issues, please contact lavery91@gmail.com


