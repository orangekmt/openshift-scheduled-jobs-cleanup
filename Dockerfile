FROM registry.access.redhat.com/rhel7:latest

COPY oc /usr/bin/
RUN chmod 777 /usr/bin/oc 
RUN chgrp -R 0 /usr/bin && chmod -R g+rwX /usr/bin

COPY oc.sh /tmp/oc.sh

RUN chmod 777 /tmp/oc.sh

CMD /tmp/oc.sh $USER_DURATION
