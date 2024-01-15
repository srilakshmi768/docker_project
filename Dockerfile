FROM amazoncorretto:11-alpine3.17
    LABEL author="sriveen"
    ARG DOWNLOAD_LOCATION='https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
    ARG username='petclinic'
    ARG homedir='/petclinic'
    ENV NAME=hyd
    RUN adduser -h ${homedir} -s /bin/sh -D ${username}
    USER ${username}
    WORKDIR ${homedir}
    ADD --chown=${username}:${username} ${DOWNLOAD_LOCATION} "${homedir}/spring-petclinic-2.4.2.jar"
    EXPOSE 8080
    CMD ["java" ,"-jar" ,"spring-petclinic-2.4.2.jar"]