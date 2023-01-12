install:
	pip uninstall mkdocs-unused-files -y
	pip install  --upgrade pip setuptools
	pip install --upgrade -r requirements.txt

pre-commit-install:
	pre-commit install

pre-commit-run:
	pre-commit run --all-files

docs-validate: clean
	mkdocs build -c -s

docs-validate-debug: clean
	mkdocs build -c -s -v

docs-serve: clean
	mkdocs serve

docs-build:
	mkdocs gh-deploy

osx-deps:
	brew install cairo freetype libffi libjpeg libpng zlib

ubuntu-deps:
	sudo apt-get -y install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev

clean:
	rm -rf site
	rm -rf .cache