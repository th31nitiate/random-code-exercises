package main

import "testing"

func TestName(t *testing.T) {
	name := getName()

	if name != "World!" {
		t.Error("Response from getName has an unexpected value")
	}
}