load("@aspect_bazel_lib//lib:tar.bzl", "tar")
load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@contrib_rules_jvm//java:defs.bzl", "java_binary", "java_junit5_test", "java_library", "java_test_suite")
load("@rules_jvm_external//:defs.bzl", "artifact")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "oci_push", "oci_tarball")

java_binary(
    name = "main",
    main_class = "com.test.Main",
    runtime_deps = [":lib"],
)

java_library(
    name = "lib",
    srcs = glob(["src/main/java/**/*.java"]),
    resources = glob(["src/main/resources/**/*"]),
    deps = [
        artifact("org.apache.logging.log4j:log4j-api"),
        artifact("org.apache.logging.log4j:log4j-core"),
        artifact("com.fasterxml.jackson.dataformat:jackson-dataformat-yaml"),
        artifact("com.fasterxml.jackson.core:jackson-databind"),
    ],
)

java_test_suite(
    name = "tests",
    size = "small",
    srcs = glob(["src/test/java/**/*.java"]),
    runner = "junit5",
    test_suffixes = ["Test.java"],
    runtime_deps = [
        artifact("org.junit.jupiter:junit-jupiter-engine"),
    ],
    deps = [
        ":lib",
        artifact("org.junit.jupiter:junit-jupiter-api"),
        artifact("org.junit.platform:junit-platform-launcher"),
        artifact("org.junit.platform:junit-platform-reporting"),
    ],
)

tar(
    name = "layer",
    srcs = ["main_deploy.jar"],
)

oci_image(
    name = "image",
    base = "@distroless_java",
    entrypoint = [
        "java",
        "-jar",
        "/proj/main_deploy.jar",
    ],
    tars = [":layer"],
)

oci_tarball(
    name = "image_tarball",
    image = ":image",
    repo_tags = ["nsemmler/app:v0.0.1"],
)

container_structure_test(
    name = "container_test",
    configs = ["container_test.yaml"],
    image = ":image",
    tags = ["requires-docker"],
)
