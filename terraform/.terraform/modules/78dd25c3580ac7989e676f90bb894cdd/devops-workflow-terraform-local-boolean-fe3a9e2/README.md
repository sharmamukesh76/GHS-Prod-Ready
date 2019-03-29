Terraform module to simplify and expand boolean use
===

Since Terraform currently doesn't have a boolean variable type, this provides a consistent handling. The list of true values is also expanded.

Designed to simplify the use of booleans (especially where 1 variable is tested many times) and the using count to enable/disable resources.

* Will handle any capitalization of the input value.
* Will return 1 for any true value, 0 for anything else.
* Current true values: true, t, 1, on, enable

Example: If
```hcl
module "boolean" {
  source  = "devops-workflow/boolean/local"
  value   = "${var.boolean}"
}

var = "${module.boolean.value ? "true setting" : "false setting"}"
```

Example: count for enabling/disabling a resource
```hcl
module enabled" {
  source  = "devops-workflow/boolean/local"
  value   = "${var.enabled}"
}

resource "resource_type" "resource_name" {
  count = "${module.enabled.value}"
}
```
