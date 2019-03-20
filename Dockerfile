FROM hashicorp/terraform:light
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
COPY aws-make-bucket /usr/local/bin/aws-make-bucket
RUN chown a+x /usr/local/bin/aws-make-bucket
ENTRYPOINT [""]
