package main

import (
    "errors"
    "fmt"
    "log"
    "math/rand"
    "strconv"
    "time"
)

var helloList = []string{
    "hello world",
    "Καλημέρα κόσμε",
    "こんにちは世界",
    "‫مالس‬ ‫ایند‬‎",
    "Привет, мир",
}

func main() {
    rand.Seed(time.Now().UnixNano())

    index := rand.New(len(helloList))

    msg, err := hello()
    if err != nil {
        log.Fatal(err)
    }

    fmt.Printf(msg)
}


func hello(index int) (string, error) {
    if index < 0 || index > len(helloList)-1 {
        return "", fmt.Errorf("index out of range: %d", index)
    }

    return helloList[index], nil
}