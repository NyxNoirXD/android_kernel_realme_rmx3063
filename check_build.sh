DIRS=$(git diff --name-only LunaCore..HEAD | grep '\.c$' | xargs -n1 dirname | sort -u)

for d in $DIRS; do
    echo "Compiling $d..."
    make -j$(nproc --all) ARCH=arm64 O=out CC="clang" CROSS_COMPILE="${PWD}/gcc/bin/aarch64-linux-android-" CLANG_TRIPLE="aarch64-linux-gnu-" M=$d modules || break
done

