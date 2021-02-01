load("@rules_foreign_cc//tools/build_defs:configure.bzl", "new_configure_make")

def copy(copy_files, ncm = new_configure_make, configure_in_place = False, **kwargs):
    lines = []
    if copy_files:
        lines.append("# Copy files")
    for k, v in copy_files.items():
        if configure_in_place:
            lines.append("""find -L $$EXT_BUILD_ROOT$$ -type f -name "{}" -exec sh -c "ln -sf {{}} $$BUILD_TMPDIR$$/{}" \;""".format(k, v))
        else:
            workspace_name = native.repository_name()[1:]
            lines.append("""find -L $$EXT_BUILD_ROOT$$ -type f -name "{}" -exec sh -c "ln -sf {{}} $$EXT_BUILD_ROOT$$/external/{}/{}" \;""".format(k, workspace_name, v))

    ncm(
        prefix_script = "\n".join(lines),
        configure_in_place = configure_in_place,
        **kwargs,
    )
