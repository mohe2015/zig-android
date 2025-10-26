//! By convention, root.zig is the root source file when making a library.
const std = @import("std");
const c = @cImport({
    @cInclude("jni.h");
    @cInclude("android/native_activity.h");
});

export fn ANativeActivity_onCreate(_: *c.ANativeActivity, _: *void, _: usize) void {
    std.debug.print("test", .{});
}
