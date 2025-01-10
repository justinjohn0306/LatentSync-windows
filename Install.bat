# Step 1: Create a new conda environment
conda create -y -n latentsync python=3.10.13
conda activate latentsync

# Step 2: Install ffmpeg
conda install -y -c conda-forge ffmpeg

# Step 3: Install Python dependencies
pip install -r requirements.txt

# Step 4: Download checkpoints from HuggingFace
huggingface-cli download chunyu-li/LatentSync --local-dir checkpoints --exclude "*.git*" "README.md"

# Step 5: Create directories for auxiliary models
New-Item -ItemType Directory -Force -Path $HOME\.cache\torch\hub\checkpoints

# Step 6: Copy auxiliary files (Windows doesn't support symlinks without admin privileges)
Copy-Item -Path "checkpoints\auxiliary\2DFAN4-cd938726ad.zip" -Destination "$HOME\.cache\torch\hub\checkpoints\"
Copy-Item -Path "checkpoints\auxiliary\s3fd-619a316812.pth" -Destination "$HOME\.cache\torch\hub\checkpoints\"
Copy-Item -Path "checkpoints\auxiliary\vgg16-397923af.pth" -Destination "$HOME\.cache\torch\hub\checkpoints\"
