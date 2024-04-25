#!/bin/bash
# Command run by intellij plugin
# The argument "--output_groups" leads to an error
# Error: type 'depset' has no operator [](int)
bazel build \
    --verbose_failures \
    --tool_tag=ijwb:IDEA:community \
    --keep_going \
    --build_event_binary_file=/var/folders/4n/m79nj3h52m7_5fqmxxd0b1zm0000gn/T/intellij-bep-c2d2f481-d7c2-420b-86cc-f419b3a30ea8 \
    --nobuild_event_binary_file_path_conversion \
    --curses=no \
    --color=yes \
    --progress_in_terminal_title=no \
    --noexperimental_run_validations \
    --output_groups=intellij-resolve-java-direct-deps,intellij-info-generic,intellij-info-java-direct-deps \
    --aspects=@@intellij_aspect//:intellij_info_bundled.bzl%intellij_info_aspect "--override_repository=intellij_aspect=/Users/nsemmler/Library/Application Support/JetBrains/IdeaIC2022.3/plugins/ijwb/aspect" \
    -- //:junit5-jupiter-starter-bazel //:Main //:src/test/java/com/test/OtherTest //:src/test/java/com/test/SomeTest
