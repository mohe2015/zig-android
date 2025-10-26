const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const libzig = b.addLibrary(.{
        .name = "zig",
        .linkage = .dynamic,
        .version = .{ .major = 1, .minor = 2, .patch = 3 },
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    libzig.root_module.addSystemIncludePath(std.Build.LazyPath{ .cwd_relative = "/home/moritz/Android/Sdk/ndk/29.0.14206865/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/" });
    libzig.root_module.addSystemIncludePath(std.Build.LazyPath{ .cwd_relative = "/home/moritz/Android/Sdk/ndk/29.0.14206865/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/aarch64-linux-android/" });
    b.installArtifact(libzig);
}
