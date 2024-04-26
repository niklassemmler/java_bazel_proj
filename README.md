Install bazel & buildifier
    
    brew install bazel buildifier

Install relative new Intellij IDEA

After adding java libraries run `bazel run @maven//:pin` 

Load image into docker with 

    docker load --input $(bazel cquery //:image_tarball --output=files)

Execute docker with

    docker run --rm -ti nsemmler/app:v0.0.1
