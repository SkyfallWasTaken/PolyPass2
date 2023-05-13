# Set shell for Windows OSs:
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

moon2lua:
    moonc src -t moon-out

lint:
    moonc -l src