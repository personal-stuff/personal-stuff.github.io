package main

import (
	"net/http"

	"github.com/sirupsen/logrus"
)

func main() {
	fs := http.FileServer(http.Dir("static"))

	http.Handle("/", fs)
	for i := 0; i < 3; i++ {
		logrus.Infof("Logs are generated")
	}
	http.ListenAndServe(":8080", nil)
}
