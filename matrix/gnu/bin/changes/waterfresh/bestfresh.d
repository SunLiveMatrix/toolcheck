module matrix.gnu.bin.changes.waterfresh.bestfresh;


import std.string;
import std.array;
import std.numeric;
import std.getopt;
import std.zlib;

version(GNU)
extern(D) {}


public static void bestFresh(string fresh, string cool, string cold, string good, string best) (ref RefAppender) {
    return new RefAppender(fresh, cool, cold, good, best);
}