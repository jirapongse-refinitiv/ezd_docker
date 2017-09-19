FROM oraclelinux:6
MAINTAINER Thomson Reuters Active Help Service
LABEL "Run command"="sudo docker run -v host_ezd_path:/var/ezd -p host_port:14002 -i -t image_name" \
      "license file"="license.txt"
RUN mkdir -p /opt/thomsonreuters/SOFTWARE /var/ezd/log
ADD ./ezd1.2.1.L1.linux.rrg.tar /opt/thomsonreuters/SOFTWARE
COPY runezd.sh /opt/thomsonreuters/SOFTWARE/
RUN chmod +x /opt/thomsonreuters/SOFTWARE/runezd.sh
ENV PATH="/opt/thomsonreuters/SOFTWARE/ezd1.2.1.L1.linux.rrg/rhel6_x86_64/demo:${PATH}" \
   LD_LIBRARY_PATH="/opt/thomsonreuters/SOFTWARE/ezd1.2.1.L1.linux.rrg/rhel6_x86_64/demo"
CMD /opt/thomsonreuters/SOFTWARE/runezd.sh
