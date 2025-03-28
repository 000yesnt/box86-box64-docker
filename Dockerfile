FROM --platform=linux/arm64 debian:bookworm-slim AS box-base

ARG DEBIAN_FRONTEND=noninteractive

COPY scripts /scripts
RUN apt update \
	&& apt install -y --no-install-recommends --no-install-suggests wget curl ca-certificates locales gpg \
	&& /scripts/install-box64.sh && /scripts/install-box86.sh \
	&& dpkg --add-architecture armhf

# Check Box86 and Box64's latest commit - if these change, the cache is reset
ADD "https://api.github.com/repos/ptitSeb/box86/commits?per_page=1" latest_commit_box86
ADD "https://api.github.com/repos/ptitSeb/box64/commits?per_page=1" latest_commit_box64
RUN apt update \
	&& apt install -y box64-generic-arm box86-generic-arm:armhf libc6:armhf
