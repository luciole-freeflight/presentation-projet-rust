sudo podman run \
	-v `pwd`:/var/docs/:ro \
	-v `pwd`/plantuml-images/:/var/docs/plantuml-images/:rw \
	-v `pwd`/public/:/var/docs/public/:rw \
	-v /tmp/:/tmp/:rw \
	--entrypoint pandoc \
	ojob/pandoc-plantuml \
	--filter pandoc-plantuml \
	-d slideshow.yml -d theme/pandoc-params.yml \
	$*

