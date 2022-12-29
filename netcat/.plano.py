from plano import *

image_tag = "quay.io/skupper/netcat"

@command
def build():
    run(f"podman build -t {image_tag} .")

@command
def run_():
    build()
    run(f"podman run --net host {image_tag} -h")

@command
def debug():
    build()
    run(f"podman run --net host -it  --entrypoint /bin/bash {image_tag}")

@command
def push():
    run("podman login quay.io")
    build()
    run(f"podman push {image_tag}")
