// Module Dependencies

module "network" {
  source = "./network"
  # ...
}

module "compute" {
  source = "./compute"
  # ...
  depends_on = [module.network]
}
