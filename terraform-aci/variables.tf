variable "ghcr_token" {
  description = "GitHub PAT with read:packages scope"
  type        = string
  sensitive   = true
}
