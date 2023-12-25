package token

import "time"

// Maker is an interface for managing token
type Maker interface {
	//CreateToken creates new token for specific username and duration
	CreateToken(username string, duraion time.Duration) (string, error)

	//VerifyToken checks whether token is valid or not
	VerifyToken(token string) (*Payload, error)
}
