Set-Location src

$null = New-Item -Type Directory -Force public
$null = New-Item -Type Directory -Force plantuml-images

docker run `
    --rm `
    -v ${PWD}/:/var/docs/:ro `
    -v ${PWD}/plantuml-images/:/var/docs/plantuml-images/:rw `
    -v ${PWD}/public/:/var/docs/public/:rw `
    --entrypoint pandoc `
    docker.io/ojob/pandoc-plantuml `
    --filter pandoc-plantuml `
    -d theme/pandoc-params.yml `
    (Get-ChildItem -Filter *.md) `
    $Args

Set-Location ..
