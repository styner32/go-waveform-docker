package main

import (
  "github.com/styner32/go-wave-to-json"
  "os"
  "log"
)

func main() {
  if len(os.Args) < 3 {
    log.Fatal("insuffient aguments: wave_to_json <input file> <output file>")
  }

  waveform.Generate(os.Args[1], os.Args[2])
}
