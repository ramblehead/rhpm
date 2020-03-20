#!/bin/bash

BIN=/usr/bin
MAN=/usr/share/man/man1

PRIORITY=360
BINV=3.6
MANV=3.6.1

update-alternatives --install $BIN/clang clang $BIN/clang-$BINV $PRIORITY \
    --slave $BIN/clang++                        clang++                     $BIN/clang++-$BINV \
    --slave $BIN/clang-apply-replacements       clang-apply-replacements    $BIN/clang-apply-replacements-$BINV \
    --slave $BIN/clang-check                    clang-check                 $BIN/clang-check-$BINV \
    --slave $BIN/clang-query                    clang-query                 $BIN/clang-query-$BINV \
    --slave $BIN/clang-rename                   clang-rename                $BIN/clang-rename-$BINV \
    --slave $BIN/clang-tblgen                   clang-tblgen                $BIN/clang-tblgen-$BINV \
    --slave $BIN/clang-tidy                     clang-tidy                  $BIN/clang-tidy-$BINV \
    --slave $BIN/asan_symbolize                 asan_symbolize              $BIN/asan_symbolize-$BINV \
    --slave $MAN/clang.gz                       clang.gz                    $MAN/clang-$MANV.gz \
    --slave $MAN/clang-apply-replacements.gz    clang-apply-replacements.gz $MAN/clang-apply-replacements-$MANV.gz \
    --slave $MAN/clang-check.gz                 clang-check.gz              $MAN/clang-check-$MANV.gz \
    --slave $MAN/clang-tblgen.gz                clang-tblgen.gz             $MAN/clang-tblgen-$MANV.gz \
    --slave $MAN/clang-tidy.gz                  clang-tidy.gz               $MAN/clang-tidy-$MANV.gz \
    --slave $MAN/scan-view.gz                   scan-view.gz                $MAN/scan-view-$MANV.gz \
    --slave $MAN/scan-build.gz                  scan-build.gz               $MAN/scan-build-$MANV.gz \
    --slave $MAN/pp-trace.gz                    pp-trace.gz                 $MAN/pp-trace-$MANV.gz
