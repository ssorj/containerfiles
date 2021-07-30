FROM registry.access.redhat.com/ubi8/ubi-minimal AS build

RUN microdnf -y update && microdnf clean all
RUN microdnf -y install make python3 && microdnf clean all

COPY . /app

WORKDIR /app
RUN make build

FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf -y update && microdnf clean all
RUN microdnf -y install python3 && microdnf clean all

COPY --from=build /usr/bin/plunk /usr/bin/plunk
COPY --from=build /usr/lib/plunk /usr/lib/plunk

CMD ["/usr/bin/plunk"]
