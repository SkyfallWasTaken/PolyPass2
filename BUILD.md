# Building the game

## Requirements

- **Love2D 11.4 Mysterious Mysteries** or later
  - It _might_ work with older versions, but **no support is provided.**
- **Just**
  - Available at <https://github.com/casey/just>
- **YueScript**
  - Available at <https://yuescript.org/>
- **Selene**
  - If you have Cargo, run

  ```sh
  cargo install selene
  ```

  - If you don't, you can install it from QuickInstall.
    Get a compiled version here for your OS: <https://github.com/cargo-bins/cargo-quickinstall/releases/tag/selene-0.25.0>

    Then put it somewhere in your `PATH`.

## Running the game

```sh
just
```

## Cleaning the `build` directory

```sh
just clean
```

## Linting

TODO
