const std = @import("std");
const bugPrint = std.debug.print;

const loxErrors = error {
    ToManyFiles,
    SyntaxError, 
    OutofMemory,
};


const lox = struct {
   
    fn scan(file: []const []const u8) loxErrors!void {
        
        if (file.len > 1) { 
            bugPrint("Usage: zlox ...\n", .{});
            return loxErrors.ToManyFiles;
        } else if (file.len == 1) {
            try runFile(file[0]); 
        } else {
            runPrompt();
        }
    }

    fn runFile(file: []const u8) !void {
        bugPrint("scanning {any}\n", .{file});
    }

    fn runPrompt() void {
        bugPrint("Running prompt\n", .{});
    }
};


pub fn main() !void {
    
    const filename = [_][]const u8{"filename", "filename2"};

    bugPrint("{d}\n", .{filename.len});
    
    try lox.scan(&filename); 
}
