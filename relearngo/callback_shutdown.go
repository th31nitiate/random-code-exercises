package main

import "fmt"
import "net/http"
import "os"

func main() {
	http.HandleFunc("/shutdown", shutdown)
	http.HandleFunc("/", homePageAlt)
	http.ListenAndServe(":8080", nil)
}

func homePageAlt(res http.ResponseWriter, req *http.Request) {
	if req.URL.Path != "/" {
		http.NotFound(res, req)
		return
	}
	fmt.Fprint(res, "The homepage.")
}

func shutdown(res http.ResponseWriter, req *http.Request) {
	os.Exit(0)
}
