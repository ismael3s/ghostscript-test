# Ghostscript Demo

To run this demo you have three options:

1. Execute the script on your machine
2. Run the Docker container with the command make run
3. Manually build and run the container

## Options 1. - Execute on your machine

Ensure that the script has permission to be executed

```
sudo chmod +x script.sh
```

And after it you can run the script with

```sh
./script.sh
```

if you don't have ghostscript installed you'll be prompted to insert your linux password to install the CLI

## Option 2. - Run the docker container with the Makefile

If you have `make` installed, you can simply run

```sh
make run
```

## Option 3. - Build and run the container manually

```
docker build -t pdfcompresser .
docker run -v $(pwd)/pdf:/scripts/pdf pdfcompresser
```
