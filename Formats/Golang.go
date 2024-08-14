package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "strconv"
)

var (
    Number  uint64 = 0
    Number2 uint64 = 0
    Number3 uint64 = ^uint64(0)
)

func main() {
    file := "File.txt"
    if _, err := os.Stat(file); os.IsNotExist(err) {
        err := ioutil.WriteFile(file, []byte("Goodbye Cruel World!"), 0644)
        if err != nil {
            fmt.Println("Error creating file:", err)
            return
        }
    }

    fmt.Println("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!")
    fmt.Println("Press Enter to continue...")
    fmt.Scanln()
    End()
}

func End() {
    os.Stdout.Sync()
    file := "File.txt"
    contents, err := ioutil.ReadFile(file)
    if err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    for Number = 0; Number < Number3; Number2++ {
        err := ioutil.WriteFile(file, append(contents, contents...), 0644)
        if err != nil {
            fmt.Println("Error writing to file:", err)
            return
        }
        fmt.Printf("\r%d", Number2+1)
        os.Stdout.Sync()
        os.Stdout.WriteString(strconv.Itoa(int(Number2+1)))
        file2 := fmt.Sprintf("File (%d).txt", Number2)
        err = os.Link(file, file2)
        if err != nil {
            fmt.Println("Error creating link:", err)
            return
        }
        file = file2
    }
    fmt.Println()
}

