
# Safer - Paranoid Lua programming

Taking defensive programming to the next level. Use this module
to avoid unexpected globals creeping up in your code, and stopping
sub-modules from fiddling with fields of tables as you pass them
around.

## API

#### `safer.globals([exception_globals], [exception_nils])`

No new globals after this point.

`exception_globals` is an optional set (keys are strings, values are `true`) specifying names
to be exceptionally accepted as new globals. Use this in case you have to declare a legacy
module that declares a global, for example. A few legacy modules are already handled by default.

`exception_nils` is an optional set (keys are strings, values are `true`) specifying names
to be exceptionally accepted to be accessed as nonexisting globals. Use this in case code
does feature-testing based on checking the presence of globals. A few common feature-test
nils such as `jit` and `unpack` are already handled by default.

#### `t = safer.table(t)`

Block creation of new fields in this table.

Note that this is implemented creating a proxy table, so:

* Equality tests will fail: `safer.table(t) ~= t`
* If anyone still has a reference to this table prior
  to creating the safer version, they can still mess
  with the unsafe table and affect the safe one.

#### `t = safer.readonly(t)`

Make table read-only: block creation of new fields in this table
and setting new values to existing fields.

Note that this is implemented creating a proxy table, so:

* Equality tests will fail: `safer.readonly(t) ~= t`
* If anyone still has a reference to this table prior
  to creating the safer version, they can still mess
  with the unsafe table and affect the safe one.

About
-----

This module was created by [Hisham Muhammad](http://hisham.hm/) - [@hisham_hm](http://twitter.com/hisham_hm)

Licensed under the terms of the MIT License, the same as Lua.

During its genesis, this module was called "safe", but I renamed it
to "safer" to remind us that we are never fully safe. ;)

