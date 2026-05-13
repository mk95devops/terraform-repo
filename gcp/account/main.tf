data "google_billing_account" "acct" {
    display_name = "My Billing Account"
    open = true
}
resource "random_password" "password" {
    length = 16
    numeric = false
    special = false
    lower = true
    upper = false
}
resource "google_project" "test-project" {
  name       = "test-project"
  project_id = random_password.password.result
  google_billing_account = data.google_billing_account.acct.id
}