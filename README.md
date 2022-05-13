# redo-c-bug

This bug causes spurious rebuilds, at least part of the causal chain
is that the .dep.$target file contains a bogus path.

```
$ cd redo-c-bug
$ cd mescc
$ redo-ifchange bin/mescc
+ exec
+ case "$1" in
+ redo-ifchange mes-sources.list nyacc-sources.list ../stage0/all.done
redo   mes-sources.list # ./default.do
+ exec
+ case "$1" in
+ date
redo   nyacc-sources.list # ./default.do
+ exec
+ case "$1" in
+ date
redo   ../stage0/all.done # ./default.do
+ exec
+ case "$1" in
+ redo-ifchange ./some-dir/some-file.txt
+ date
+ date
# Bogus paths in the depfile, .././default.do does not exist.
$ cat .dep.mes-sources.list
=18d60ae6787a1f39a5960226550793655233ae81df384a8a33150a178412960d 00000000627dcd35 .././default.do
=3de81c64ade6bde7632191d281f07652963c0e077fb8632c7d98d62dc41a3617 00000000627dd1d1 ../mes-sources.list
# Next we get infinite spurious builds because the deps don't exit.
$ redo-ifchange bin/mescc
redo   mes-sources.list # ./default.do
+ exec
+ case "$1" in
+ date
redo   nyacc-sources.list # ./default.do
+ exec
+ case "$1" in
+ date
redo   ../stage0/all.done # ./default.do
+ exec
+ case "$1" in
+ redo-ifchange ./some-dir/some-file.txt
+ date
+ date
```