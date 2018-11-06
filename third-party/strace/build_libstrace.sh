#!/bin/sh

for f in linux/x86_64/*; do perl -i -pe 's/\.r([a-z]{2}\b)/.e$1/g; s/\br10\b/esi/g; s/\br8\b/edi/g; s/\br9\b/ebp/g; s/orig_rax/orig_eax/g; s/\bcs\b/xcs/g' "$f"; done
git checkout -- ./linux/x86_64/arch_kvm.c
make || true
make -f Makefile.libstrace
