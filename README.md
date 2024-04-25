Project builds with `bazel build //:all` and tests run with `bazel test //:Tests`, but project does not build when sync'd in the Intellij Bazel plugin.

Instead it creates the error:

```
Traceback (most recent call last):
	File "/private/var/tmp/_bazel_niklassemmler/70641108bc357a5c1cd378cfa96874dc/external/intellij_aspect/intellij_info_bundled.bzl", line 67, column 37, in _aspect_impl
		return intellij_info_aspect_impl(target, ctx, semantics)
	File "/private/var/tmp/_bazel_niklassemmler/70641108bc357a5c1cd378cfa96874dc/external/intellij_aspect/intellij_info_impl_bundled.bzl", line 1144, column 32, in intellij_info_aspect_impl
		handled = collect_java_info(target, ctx, semantics, ide_info, ide_info_file, output_groups) or handled
	File "/private/var/tmp/_bazel_niklassemmler/70641108bc357a5c1cd378cfa96874dc/external/intellij_aspect/intellij_info_impl_bundled.bzl", line 598, column 29, in collect_java_info
		jars = [library_artifact(output, ctx.rule.kind) for output in java_outputs]
	File "/private/var/tmp/_bazel_niklassemmler/70641108bc357a5c1cd378cfa96874dc/external/intellij_aspect/intellij_info_impl_bundled.bzl", line 168, column 48, in library_artifact
		source_jar = artifact_location(src_jars[0]) if src_jars else None,
Error: type 'depset' has no operator [](int)
ERROR: /private/var/tmp/_bazel_niklassemmler/70641108bc357a5c1cd378cfa96874dc/external/rules_jvm_external~~maven~maven/BUILD:352:11: in @@intellij_aspect//:intellij_info_bundled.bzl%intellij_info_aspect aspect on jvm_import rule @@rules_jvm_external~~maven~maven//:org_apiguardian_apiguardian_api: 
```

The offending argument is:

```
    --output_groups=intellij-resolve-java-direct-deps,intellij-info-generic,intellij-info-java-direct-deps \
```
