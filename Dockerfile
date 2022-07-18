FROM openliberty/open-liberty:22.0.0.7-kernel-slim-java11-openj9-ubi

# Add Liberty server configuration including all necessary features
COPY --chown=1001:0  liberty/server.xml /config/


RUN features.sh

COPY --chown=1001:0  mywar.war /config/dropins/

# This script will add the requested server configurations, apply any interim fixes and populate caches to optimize runtime
RUN configure.sh