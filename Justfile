# Set shell for Windows OSs:
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

src_dir := "src"
res_dir := "res"
build_dir := "build"
build_res_dir := if os() == "windows" {
  build_dir + "\\" + res_dir
} else {
  build_dir + "/" + res_dir
}
love_file_name := "build/game.love"

run: unpackaged_build
  love {{build_dir}}

build: unpackaged_build
  {{zip_cmd}}

clean:
  rm -r {{build_dir}}

[private]
@unpackaged_build: clean
  echo "* Getting build directory..."
  mkdir {{build_dir}} {{mkdir_force_arg}} {{null}}
  echo "* Transpiling YueScript files..."
  @yue -t {{build_dir}} {{src_dir}}
  echo "* Linting..."
  selene {{build_dir}} --allow-warnings
  echo "* Creating resource symlink..."
  {{res_symlink_cmd}}

mkdir_force_arg := if os() == "windows" {
  '-Force'
} else {
  '-p'
}
rm_force_arg := if os() == "windows" {
  "-Force"
} else {
  "-f"
}
res_symlink_cmd := if os() == "windows" {
  "rm -Force" + " " + build_res_dir + "| cmd /c mklink " + build_res_dir + " " + res_dir + " /J"
} else {
  "rm -f " + build_res_dir + " && ln -s ../" + res_dir + " " + build_res_dir
}
zip_cmd := if os() == "windows" {
  "echo todo"
} else {
  "cd " + build_dir + " &&" +
  "zip -9 -r ../" + love_file_name + " ."
}
null := if os() == "windows" {
  "| Out-Null"
} else {
  "> /dev/null 2>&1"
}