const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const libzig = b.addLibrary(.{
        .name = "zig",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const android_ndk_root = std.process.getEnvVarOwned(b.allocator, "ANDROID_NDK_ROOT") catch |err| switch (err) {
        error.OutOfMemory => @panic("OOM"),
        error.EnvironmentVariableNotFound => @panic("Set environment variable ANDROID_NDK_ROOT"),
        error.InvalidWtf8 => @panic("ANDROID_NDK_ROOT environment variable is invalid UTF-8"),
    };
    const include_path = b.pathResolve(&[_][]const u8{ android_ndk_root, "toolchains", "llvm", "prebuilt", "linux-x86_64", "sysroot", "usr", "include" });
    const platform_include_path = b.pathResolve(&[_][]const u8{ include_path, "aarch64-linux-android" });
    libzig.root_module.addSystemIncludePath(.{ .cwd_relative = include_path });
    libzig.root_module.addSystemIncludePath(.{ .cwd_relative = platform_include_path });
    b.installArtifact(libzig);
}
