# aws_tf_modulesHere’s a clean README.md for your Terraform code 👇

# IAM User Terraform Module Usage

This configuration demonstrates how to create multiple **AWS IAM Users** using a reusable Terraform module.  
The users are defined dynamically with `for_each`, making the setup easily extensible and maintainable.

---

## 📂 Project Structure

```hcl
locals {
  resource_type = "iam"
}

module "iam_user" {
  # Path to the reusable IAM module
  source = "../../../_modules/iam"

  for_each = {
    "support-user"   = { path = "/demo_users/" }
    "developer-user" = { path = "/demo_users/" }
    "power-user"     = { path = "/demo_users/" }
  }

  # Use the key as the IAM username
  name = "${local.name_prefix}-${each.key}-${local.resource_type}"

  # Use the path defined in the value map
  path = each.value.path

  force_destroy = true

  tags = local.default_tags
}

⚙️ How It Works

Reusable Module
The IAM users are created using a shared module stored at ../../../_modules/iam.

Dynamic User Creation

A for_each block defines multiple users in one place.

Each user is mapped with a specific path.

Naming Convention
Usernames follow the pattern:

<name_prefix>-<user_key>-iam


Example (with local.name_prefix = demo):

demo-support-user-iam

demo-developer-user-iam

demo-power-user-iam

Tags
Each user inherits local.default_tags for consistent resource tagging.

Force Destroy
force_destroy = true ensures the user can be deleted even if it has keys, policies, or groups attached.

🧑‍💻 Adding a New User

To create another user, simply add an entry under for_each:

for_each = {
  "support-user"   = { path = "/demo_users/" }
  "developer-user" = { path = "/demo_users/" }
  "power-user"     = { path = "/demo_users/" }
  "analyst-user"   = { path = "/demo_users/" }  # New user
}


Terraform will automatically create the new IAM user.

🚨 Notes & Best Practices

Always use unique usernames to avoid conflicts.

Keep sensitive credentials (Access Keys, Secrets) out of version control.

Manage permissions for users through IAM Policies or IAM Groups, not directly attached inline.

Consider using AWS SSO or IAM Roles instead of long-lived IAM users when possible.

▶️ Usage

Initialize the working directory:

terraform init


Review the changes:

terraform plan


Apply the configuration:

terraform apply


Destroy the users (if needed):

terraform destroy

✅ Outputs (Optional)

You can extend your module to output:

IAM usernames

ARNs

Paths

Example:

output "iam_user_names" {
  value = [for u in module.iam_user : u.name]
}
