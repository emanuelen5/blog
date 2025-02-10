FLAGS?=
BUILD_DIR?=docs/
PORT?=4000

init: .install
.install: Gemfile.lock Gemfile
	bundle install
	touch $@

build:
	bundle exec jekyll build -d ${BUILD_DIR} ${FLAGS}
develop:
	FLAGS='--watch --drafts ${FLAGS}' ${MAKE} build
gh-pages: build
	touch "${BUILD_DIR}/.nojekyll"
	if [ -f README.md ]; then cp README.md "${BUILD_DIR}"; fi
htmlproofer:
	bundle exec htmlproofer --internal-domains localhost,blog.cedernaes.com  --file-ignore 'docs/tips/2025-02-10-ssh-port-forwarding/index.html' --assume-extension ${BUILD_DIR} ${FLAGS}

clean:
	rm -rf "${BUILD_DIR}" .jekyll-*

serve:
	bundle exec jekyll serve -H '*' -P ${PORT} ${FLAGS}

.PHONY:build serve gh-pages htmlproofer clean
