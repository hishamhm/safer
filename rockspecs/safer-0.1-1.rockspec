package = "safer"
version = "0.1-1"
source = {
   url = "git://github.com/hishamhm/safer",
   tag = "v0.1",
}
description = {
   summary = [[Paranoid Lua programming]],
   detailed = [[
      Taking defensive programming to the next level. Use this module
      to avoid unexpected globals creeping up in your code, and stopping
      sub-modules from fiddling with fields of tables as you pass them
      around.
   ]],
   homepage = "http://github.com/hishamhm/safer",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
      safer = "safer.lua",
   }
}
