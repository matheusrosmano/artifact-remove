package mapper

import "time"

type Artifact struct {
	Id        int       `json:"id"`
	NodeId    string    `json:"node_id"`
	Name      string    `json:"name"`
	Url       string    `json:"url"`
	CreatedAt time.Time `json:"created_at"`
	ExpiresAt time.Time `json:"expires_at"`
}
