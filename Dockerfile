# Use GraalVM instead of OpenJDK or Eclipse Temurin images
FROM ghcr.io/graalvm/graalvm-community:23.0.1-ol9

# Install pbzip2 for parallel extraction
RUN microdnf update -y oraclelinux-release-el9 \
  && microdnf install -y --enablerepo=ol9_appstream \
  wget \
  pbzip2 \
  && microdnf clean all

WORKDIR /photon

# Download Photon
ADD https://github.com/komoot/photon/releases/download/0.6.1/photon-0.6.1.jar /photon/photon.jar

# Add startup script
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

# Create volume and expose Photon instance
VOLUME /photon/photon_data
EXPOSE 2322

ENTRYPOINT ["/photon/entrypoint.sh"]
