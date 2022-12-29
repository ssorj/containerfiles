from plano import *

image_tag = "proton-devel"

@command
def clean():
    run(f"podman rmi {image_tag}")

@command
def build():
    run(f"podman build -t {image_tag} .")

@command
def shell():
    run(f"podman run -it {image_tag} /bin/bash")

@command
def push():
    run(f"podman push {image_tag}")
