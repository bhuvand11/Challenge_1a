# Challenge 1A — Heading Detection from PDFs

---

## 🌐 Overview

This repository contains a Dockerized, offline-compatible solution for Adobe India Hackathon Challenge 1A, which involves identifying structural headings (`title`, `H1`, `H2`, `H3` ) from raw PDF documents.

The model has been trained and tested on representative samples and is compatible with **Linux AMD64**, fully functional **offline**, and deployed using Docker.

---

## ✍️ Approach

### 1. PDF Parsing

* Utilizes `PyMuPDF` to extract text, font size, and layout information from the PDF.

### 2. Feature Engineering

* Constructs structured features such as:

  * Font size
  * Text length
  * Capitalization ratio
  * Position in page

### 3. Classification Model

* A **Random Forest Ensemble** model is trained to classify blocks into:

  * `title`
  * `body`
  * `H1`
  * `H2`
  * `H3`
* The trained model is stored in `models/heading_model_ensemble.joblib`

---

## 📦 Libraries Used

* `PyMuPDF`
* `scikit-learn`
* `numpy`, `pandas`
* `joblib`

  CSV File used to train the model : https://docs.google.com/spreadsheets/d/1-U3W9n-hA6i9D59kszel2VikiAFQ1j7GkHLTG_uTF2s/edit?usp=sharing

---

## 🐳 Docker Instructions

### 🔧 Build the Docker Image

```bash
docker build --platform linux/amd64 -t pdf-processor .
```

### 🚀 Run the Container

```bash
docker run --rm \
  -v "$(pwd)/sample_dataset/pdfs":/app/input:ro \
  -v "$(pwd)/sample_dataset/outputs":/app/output \
  --network none \
  pdf-processor
```

---

## 📂 Folder Structure

```
Challenge_1a/
├── process_pdfs.py
├── models/
│   └── heading_model_ensemble.joblib
├── sample_dataset/
│   ├── pdfs/           # Input PDFs
│   └── outputs/        # Output JSONs
├── Dockerfile
├── .dockerignore
└── README.md
```

---

## ✅ Output

* Each PDF is parsed and labeled into `title`, `H1`, `H2`, `H3` blocks
* Output is stored as a structured JSON in the `outputs/` folder

---

## 📎 Notes

* Fully offline — no external API or internet dependency
* Tested on Linux AMD64 via Docker
* Built-in model loading using `joblib`


