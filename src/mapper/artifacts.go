package mapper

type Artifacts struct {
	TotalCount int        `json:"total_count"`
	Artifacts  []Artifact `json:"artifacts"`
}
