package main

import (
	"fmt"
	"os"
	"strings"
)

func Concat(parts ...string) string {
	if len(parts) == 0 {
		fmt.Printf("no strings supplied\n")
		return ""
	}

	return strings.Join(parts, " ")
}

func main() {
	args := os.Args[1:]
	result := Concat(args...)
	fmt.Printf("Concantenated string: '%s'\n", result)
}
