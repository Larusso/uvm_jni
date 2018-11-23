set -ex

main() {
  cargo build
  cargo build --release

  if [ ! -z $DISABLE_TESTS ]; then
    return
  fi

  cargo test
  cargo test --release
}

if [ -z $TRAVIS_TAG ]; then
    main
fi
