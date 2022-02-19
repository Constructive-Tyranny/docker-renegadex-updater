FROM ubuntu:impish
ENV TERM xterm
VOLUME /mounted_volume
COPY entrypoint.sh /usr/bin/entrypoint
RUN groupadd -g 1010 wineuser \
    && useradd --shell /bin/bash --uid 1010 --gid 1010 wineuser \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y cmake rustc ca-certificates
# Switch to Jupiter user for security reasons.
USER wineuser
ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/bash"]