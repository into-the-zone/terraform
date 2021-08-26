variable "project" {}
variable "credentials_file" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "os_image" {
  default     = "debian-cloud/debian-9"
  description = "This is a description from the end user's perspective"
  type        = string
}


variable "my_list" {
  type        = list(number)
  description = "This a list of string, anything will be converted to strings"
  default     = [12, "34.6"]
}


variable "my_tuple" {
  type        = tuple([string, number, bool])
  description = "This a correct tuple"
  default     = ["hello", 42, true]
}

variable "my_set" {
  type        = set(number)
  description = "This a set of unique numbers"
  default     = [42, 4, 2] # == [2, 42, 4] == [42, 42, 4, 2, 2]
}


variable "vm_params" {
  type        = object({
    name                      = string
    machine_type              = string
    zone                      = string
    allow_stopping_for_update = bool
  })
  description = "vm parameters"
  default     = {
    name                      = "terraform-instance"
    machine_type              = "f1-micro"
    zone                      = "us-central1-a"
    allow_stopping_for_update = true
  }

  validation {
    condition     = length(var.vm_params.name) > 3
    error_message = "VM name must be at least 4 characters."
  }
}
















variable my_map {
	type = map(string)
    description = "GCP provider params"
    default = {
		project = "myprojectname"
		credentials = "cred.json"
		region = "us-central1"
	}
}

variable my_complex_object {
    type = object({
		name         = string
		machine_type = string
        zone         = string
        allow_stopping_for_update = bool
        disk = object({
			source_image = string
			auto_delete = bool
			boot   = bool
		})
	})

    default = {
		name = "appserver"
		machine_type = "f1-micro"
		zone = "us-central1-a"
		allow_stopping_for_update = "true"

        disk = {
	        source_image      = "debian-cloud/debian-9"
            auto_delete       = true
            boot              = true
	    }
	}

      
}
