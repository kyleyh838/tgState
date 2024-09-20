package assets

import "embed"

var (
	//go:embed templates
	Templates embed.FS

	//go:embed favicon.ico
	Favicon embed.FS
)
