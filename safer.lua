
local safer = {}

function safer.readonly(t)
   local st = {}
   setmetatable(st, {
      __index = t,
      __newindex = function(_, k, _)
         error("Attempting to set field '"..tostring(k).."' in read-only table.")
      end,
   })
   return st
end

function safer.table(t)
   local st = {}
   setmetatable(st, {
      __index = t,
      __newindex = function(_, k, v)
         if rawget(t,k) ~= nil then
            rawset(t,k,v)
         else
            error("Attempting to create field '"..tostring(k).."' in a safe table.")
         end
      end,
   })
   return st
end

function safer.globals(exception_globals, exception_nils)
   exception_globals = exception_globals or {}
   exception_nils = exception_nils or {}
   -- used in typical portability tests
   local allowed_nils = {
      module = true,
      unpack = true,
      jit = true,
   }
   -- legacy modules that set globals
   local allowed_globals = {
      lfs = true,
      copcall = true,
      coxpcall = true,
   }
   setmetatable(_G, {
      __index = function(_, k)
         if allowed_nils[k] or exception_nils[k] then
            return nil
         end
         error("Attempting to access an undeclared global.")
      end,
      __newindex = function(t, k, v)
         if allowed_globals[k] or exception_globals[k] then
            rawset(t, k, v)
            return
         end
         error("Attempting to assign a new global '"..k.."'\n"..debug.traceback())
      end,
   })
end

return safer

