local typedefs = require "kong.db.schema.typedefs"


return {
  name = "forwarded",
  fields = {
    { consumer  = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { host  = typedefs.host },
          { port  = typedefs.port },
          { proto = { type = "string", one_of = { "http", "https" } } },
          { prefix = typedefs.path },
        },
      },
    },
  },
  entity_checks = {
    { at_least_one_of = { "config.host", "config.port", "config.proto", "config.prefix" } },
  },
}
