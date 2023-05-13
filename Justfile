# Set shell for Windows OSs:
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

src_dir := "src"
build_dir := "build"
force_arg := if os() == 'windows' {
                '-Force '
             } else {
                '-p'
             } 

moon2lua:
    mkdir {{build_dir}} {{force_arg}}
    moonc -t {{build_dir}}/moon-out {{src_dir}}

lint:
    moonc -l {{src_dir}}