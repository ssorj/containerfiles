from plano import *

image_tag = "quay.io/ssorj/dvdrental"

@command
def build(no_cache=False):
    run(f"gunzip --keep --force dvdrental.tar.gz")
    run(f"podman build {'--no-cache' if no_cache else ''} -t {image_tag} .")

@command(name="run")
def run_():
    build()
    run(f"podman run -p 5432:5432 --rm -it {image_tag}")

@command
def login():
    run("podman login quay.io")

@command
def push():
    login()
    run(f"podman push {image_tag}")

@command
def clean():
    remove("dvdrental.tar")
    remove("__pycache__")
