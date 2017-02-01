#!/usr/bin/env bash

watchman watch "${HOME}/Devel/atom/atom-language-utl/lib"

watchman -j <<-EOT
["trigger", "${HOME}/Devel/atom/atom-language-utl/lib",
    {
      "name": "generate_grammar",
      "expression": [
          "suffix",
          "coffee"
      ],
      "command": ["make"]
    }]
EOT
