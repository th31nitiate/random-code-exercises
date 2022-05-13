package main

import (
	"fmt"
	gcfg "gopkg.in/gcfg.v1"
)

func main() {
	config := struct {
		Section struct {
			Enabled bool
			Path    string
		}
	}{}

	err := gcfg.ReadFileInto(&config, "config.ini")
	if err != nil {
		fmt.Printf("Failed to parse config file: %s\n", err)
	}
	fmt.Println(config.Section.Enabled)
	fmt.Println(config.Section.Path)
}
