FROM python:3-alpine AS builder
# install gcc and libffi headers
RUN apk add --no-cache build-base libffi-dev
# create virtual environment
RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"
# install lib
RUN pip install -q 'xdcc-dl==5.0.0'

## build the actual image
FROM python:3-alpine
# copy the lib
COPY --from=builder /opt/venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

ENTRYPOINT ["xdcc-dl"]
