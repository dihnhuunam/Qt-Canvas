#!/usr/bin/env bash

set -euo pipefail

ROOT="${1:-..}"

if ! command -v cmake-format >/dev/null 2>&1; then
    echo "Error: cmake-format was not found in PATH." >&2
    echo "Hint: pip install cmakelang" >&2
    echo "Hint: export PATH=\"\$HOME/.local/bin:\$PATH\"" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$ROOT" = /* ]]; then
    ROOT_INPUT_PATH="$ROOT"
else
    ROOT_INPUT_PATH="$SCRIPT_DIR/$ROOT"
fi

ROOT_PATH="$(realpath "$ROOT_INPUT_PATH")"

# Add folders or files here if they should be skipped during formatting.
IGNORE_PATHS=(
    "log"
    ".settings"
    ".vscode"
    "build"
    "cmake"
)

CMAKE_FILES=(
    "CMakeLists.txt"
)

CMAKE_EXTENSIONS=(
    "cmake"
)

is_ignored_path() {
    local full_name="$1"

    for ignore_path in "${IGNORE_PATHS[@]}"; do
        local ignored_full_path="$ROOT_PATH/$ignore_path"

        if [[ "$full_name" == "$ignored_full_path"* ]]; then
            return 0
        fi
    done

    return 1
}

is_cmake_file() {
    local file="$1"
    local filename
    local ext

    filename="$(basename "$file")"

    for cmake_file in "${CMAKE_FILES[@]}"; do
        if [[ "$filename" == "$cmake_file" ]]; then
            return 0
        fi
    done

    ext="${file##*.}"

    # Check if file has extension
    if [[ "$file" == "$ext" ]]; then
        return 1
    fi

    ext="${ext,,}"

    for cmake_ext in "${CMAKE_EXTENSIONS[@]}"; do
        if [[ "$ext" == "$cmake_ext" ]]; then
            return 0
        fi
    done

    return 1
}

FILES=()

while IFS= read -r -d '' file; do
    if is_cmake_file "$file" && ! is_ignored_path "$file"; then
        FILES+=("$file")
    fi
done < <(find "$ROOT_PATH" -type f -print0)

if [[ "${#FILES[@]}" -eq 0 ]]; then
    echo "No CMake files found to format."
    exit 0
fi

for file in "${FILES[@]}"; do
    echo "Formatting $file"
    cmake-format -i "$file"
done

echo "Formatted ${#FILES[@]} file(s)."
