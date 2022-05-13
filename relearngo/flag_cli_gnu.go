package main

import (
	"flag"
	"fmt"
)

var opts struct {
	Name    string `short:"n" long:"name" default:"World" description:"A name to say hello to."`
	Spanish bool   `short:"s" long:"spanish" description:"Use Spanish Language"`
}

func main() {
	flag.Parse(&opts)

	if spanish == true {
		fmt.Printf("Hola %s!\n", opts.Name)
	} else {
		fmt.Printf("Hello %s!\n", *name, opts.Name)
	}
}
