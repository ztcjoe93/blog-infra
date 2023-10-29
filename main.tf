module "blog" {
  source = "./modules/blog"

  instance_type = "t4g.small"
  key_name      = "twc-keypair"
}
