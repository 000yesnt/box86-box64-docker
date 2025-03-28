# box86-box64-docker
Base image for Box86 and Box64 based on Debian. 

Uses Pi-Apps precompiled Box86/64 versions. Built weekly for Arm64.

TODO: Add 32-bit armhf support

## Usage
As part of your Dockerfile:
```dockerfile
FROM ghcr.io/000yesnt/box86-box64-docker:main
```
