#
# Get and build executables
#
FROM debian:sid as build-env

RUN apt-get update && apt-get install -y python3-pip wget
RUN pip3 install pandoc-plantuml-filter

# install pandoc
RUN wget -q https://github.com/jgm/pandoc/releases/download/2.18/pandoc-2.18-1-amd64.deb \
	-O /tmp/pandoc.deb \
	&& dpkg -i /tmp/pandoc.deb

# make slim-jdk
RUN wget -q https://download.java.net/java/GA/jdk18.0.1/3f48cabb83014f9fab465e280ccf630b/10/GPL/openjdk-18.0.1_linux-x64_bin.tar.gz \
	-O /tmp/openjdk.tar.gz \
	&& tar xfvz /tmp/openjdk.tar.gz -C /tmp/
RUN /tmp/jdk-18.0.1/bin/jlink --output /opt/openjdk-18-slim/ \
    --add-modules java.base,java.datatransfer,java.desktop,java.logging,java.prefs,java.scripting,java.xml

# make PlantUML
RUN apt-get install -y unzip
RUN wget -q https://sourceforge.net/projects/plantuml/files/1.2022.4/plantuml-jar-asl-1.2022.4.zip \
	-O plantuml.zip \
	&& unzip plantuml.zip \
	&& mkdir -p /opt/plantuml/ \
	&& mv plantuml.jar /opt/plantuml/ \
	&& rm plantuml.zip
RUN echo '#!/bin/bash\n/opt/openjdk-18-slim/bin/java -jar /opt/plantuml/plantuml.jar $@' > /usr/bin/plantuml \
	&& chmod a+x /usr/bin/plantuml

#
# Build production image
#
FROM debian:sid as prod-env
RUN apt-get update && apt-get install -y python3 graphviz libfreetype6 fontconfig git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

COPY --from=build-env /usr/local/lib/python3.10/dist-packages/ /usr/local/lib/python3.10/dist-packages/
COPY --from=build-env /usr/bin/pandoc /usr/bin/pandoc
COPY --from=build-env /usr/bin/plantuml /usr/bin/plantuml
COPY --from=build-env /usr/local/bin/pandoc-plantuml /usr/local/bin/pandoc-plantuml
COPY --from=build-env /opt/plantuml/ /opt/plantuml/
COPY --from=build-env /opt/openjdk-18-slim/ /opt/openjdk-18-slim/

WORKDIR /var/docs/
#ENTRYPOINT ["pandoc", "--filter", "pandoc-plantuml"]

