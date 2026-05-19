# aur-pebble-bin-updater

Automated updater for the `pebble-bin` AUR package. It follows the same shape
as `aur-cursor-bin-updater`: GitHub Actions checks upstream releases, generates
`PKGBUILD` from `PKGBUILD.sed`, commits the new package file, then publishes to
AUR.

## How it works

1. Every hour, `.github/workflows/update.yml` checks the latest
   `QingJ01/Pebble` GitHub Release.
2. It compares the latest release with the local `PKGBUILD` and the current
   AUR version from the AUR RPC API.
3. If an update is needed, it calculates checksums and regenerates `PKGBUILD`
   from `PKGBUILD.sed`.
4. On non-`development` branches, it publishes to AUR with
   `KSXGitHub/github-actions-deploy-aur`.

## GitHub secrets

Set these secrets in the GitHub repository:

- `AUR_USERNAME`
- `AUR_EMAIL`
- `AUR_SSH_PRIVATE_KEY`

Add the matching public key to your AUR account.

## Local test

```bash
makepkg --printsrcinfo
makepkg --verifysource
```

## Initial publish

Create the AUR package once by pushing the generated package files:

```bash
git clone ssh://aur@aur.archlinux.org/pebble-bin.git /tmp/pebble-bin-aur
cp PKGBUILD pebble-bin.sh pebble.desktop /tmp/pebble-bin-aur/
cd /tmp/pebble-bin-aur
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO pebble-bin.sh pebble.desktop
git commit -m "Initial import"
git push
```
