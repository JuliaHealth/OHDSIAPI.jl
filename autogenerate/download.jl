url = "http://webapidoc.ohdsi.org/input/input.js"
destination = "data/input.js"
nodejs = nodejs_cmd()

Downloads.download(url, destination)

run(`$nodejs parse_input.js`)
