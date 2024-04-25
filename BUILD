load("@rules_jvm_external//:defs.bzl", "artifact")
load("@contrib_rules_jvm//java:defs.bzl", "java_test_suite", "java_junit5_test")

java_binary(
    name = "Main",
    main_class = "com.test.Main",
    srcs = glob(["src/main/java/**/*.java"]),
    deps = [artifact("org.junit.jupiter:junit-jupiter-api")],
)

java_library(
    name = "junit5-jupiter-starter-bazel",
    srcs = glob(["src/main/java/**/*.java"]),
)

java_test_suite(
    name = "Tests",
    size = "small",
    srcs = glob(["src/test/java/**/*.java"]),
    runner = "junit5",
    test_suffixes = ["Test.java"],
    runtime_deps = [
        artifact("org.junit.jupiter:junit-jupiter-engine"),
    ],
    deps = [
        ":junit5-jupiter-starter-bazel",
        artifact("org.junit.jupiter:junit-jupiter-api"),
        artifact("org.junit.platform:junit-platform-launcher"),
        artifact("org.junit.platform:junit-platform-reporting"),
    ],
)