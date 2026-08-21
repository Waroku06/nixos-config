# Repository Guidelines

## Project Structure & Module Organization

This repository is a NixOS flake using the dendritic pattern. `modules/` is the flake source: `modules/aspects/` contains reusable system and Home Manager features, `modules/entities/` defines hosts, users, and hardware-specific settings, and `modules/packages/` exposes helper commands. Hosts currently include `nixos06` and `mini06`. Static assets such as the wallpaper and logo live in `assets/`. `flake.lock` pins inputs; `flake.nix` is generated and should not be edited manually.

## Build, Test, and Development Commands

- `nix run .#write-flake` regenerates the generated `flake.nix` after changing flake-file declarations.
- `nh os build .#nixos06` evaluates and builds the main host without activating it.
- `nh os switch .#nixos06` builds and activates the configuration on the current machine.
- `nh os build .#mini06` builds the minimal host for validation.
- `nix run .#vm` builds and starts the repository's VM helper for `mini06`.
- `nix flake check` evaluates flake checks and catches module errors before activation.

Keep `flake.lock` updates intentional; review the resulting diff after `nix flake update`.

## Coding Style & Naming Conventions

Format Nix with `nix fmt` when a formatter is available, and keep two-space indentation, trailing commas in multiline attribute sets/lists, and descriptive comments. Use lowercase hyphenated filenames such as `daily-use.nix`; place reusable behavior under `aspects` and machine-specific hardware or filesystem declarations under `entities`. Follow existing `den.aspects.<name>` and `includes` patterns rather than introducing a parallel module structure.

## Testing Guidelines

There is no separate test framework or coverage target. Treat `nix flake check` and host builds as the baseline test suite. Validate the smallest affected host, then test `nixos06` or `mini06` as appropriate. For changes to hardware, filesystems, boot, preservation, or disko, inspect generated configuration carefully before switching and avoid testing destructive storage changes on a live system.

## Commit & Pull Request Guidelines

Recent commits use short, imperative descriptions such as `flake update`, `fix plangothic`, and `move to den`. Keep commits focused and concise; separate dependency refreshes from behavior changes. Pull requests should explain affected hosts/modules, include the validation commands run, call out hardware or state changes, and attach screenshots when changing desktop, Plasma, terminal, or other user-facing settings.

## Security & Configuration Tips

Do not commit secrets, machine-local credentials, or private keys. Review substituters, unfree packages, filesystem labels, and device paths before sharing or applying changes. Preserve existing `nofail` behavior for optional NTFS mounts unless the operational impact is understood.
