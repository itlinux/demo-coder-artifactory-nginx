resource random_integer "string-length" {
  min = 12
  max = 25
}
resource "random_string" "coder-password" {
  length           = random_integer.string-length.result
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "_%@"
}

