#!/bin/bash

# Aktifkan virtualenv
source /app/venv/bin/activate

# Jalankan Uvicorn dengan nohup agar tetap jalan meski terminal ditutup
echo "🚀 Menjalankan FastAPI server..."
nohup uvicorn app:app --host 0.0.0.0 --port 8000 > /app/log.txt 2>&1 &

# Tampilkan PID dan info log
echo "✅ Server aktif di port 8000 (PID: $!)"
echo "🔍 Lihat log dengan: tail -f /app/log.txt"
